/*
 * splitindex.java
 * Copyright (c) Markus Kohm, 2002
 *
 * $Id: splitindex.java,v 1.2 2003/01/05 15:05:46 mjk Exp $
 *
 * This file is part of the SplitIndex package
 *
 * This file can be redistributed and/or modified under the conditions
 * of the LaTeX Project Public License, either version 1.2 of this
 * license or (at your option) any later version.
 * The latest version of this license is in
 *       http://www.latex-project.org/lppl.txt
 * and version 1.2 or later is part of all distributions of LaTeX
 * version 1999/12/01 or later.
 *
 * You are not allowed to redistribute this file without all the
 * other files of the SplitIndex package
 */

/*
  I know, I should never write an application in a single static class 
  like I do here. But I wanted the program at earch language to be one
  file.
*/

import java.util.*;
import java.util.regex.*;
import java.io.*;

public final class splitindex {
    private static ArrayList MakeIndexArgs = new ArrayList();
//     private static String Identify = "^(.*)\\\\UseIndex *\\{([^\\}]*)\\}(.*)$";
    private static String Identify = "^(\\\\indexentry)\\[([^\\]]*)\\](.*)$";
    private static String ResultIs = "$1$3";
    private static String SuffixIs = "-$2";
    private static int Verbose = 0;
    private static String IDX = null;
    private static String Jobname = null;
    private static HashMap IDXwriters = new HashMap();

    private static void ShowHelp() {
	String nl = System.getProperty( "line.separator" );
	ShowVersion();
	System.out.println();
	ShowUsage();
	System.out.println(
	    "Split a single raw index file into multiple raw index files." +nl+
	    "Example: java splitindex foo.idx." +nl+
	    nl+
	    "Options:" +nl+
	    "  -h, --help    " +
	    "\tshow this help and terminate" +nl+
	    "  -m, --makeindex PROGNAME" +nl+
	    "\t\t\tcall PROGNAME instead of default `makeindex'." +nl+
	    "  -i, --identify EXPRESSION" +nl+
	    "\t\t\tuse regular EXPRESSION to match entries" +nl+
	    "\t\t\t(see also option --resultis and --suffixis)." +nl+
	    "\t\t\tDefault is \'" + Identify + "\'." +nl+
	    "  -r, --resultis PATTERN" +nl+
	    "\t\t\tcreate line to be written from PATTERN after matching" +nl+
	    "\t\t\tlines (see also option --identify)." +nl+
	    "\t\t\tDefault is \'" + ResultIs + "\'." +nl+
	    "  -s, --suffixis PATTERN" +nl+
	    "\t\t\tcreate suffix to be used from PATTERN after matching" +nl+
	    "\t\t\tlines (see also option --identify)." +nl+
	    "\t\t\tDefault is \'" + SuffixIs +"\'." +nl+
	    "  -v, --verbose " +
	    "\tbe more verbose" +nl+
	    "\t\t\t(can be used multiple to increase verbosity)" +nl+
	    "      --version " +
	    "\tshow version and terminate"
	    );
	System.exit( 0 );
    }

    private static void ShowVersion() {
	System.out.println( "splitindex.pl 0.1" );
	System.out.println( "Copyright (c) 2002 Markus Kohm <kohm@gmx.de>" );
    }

    private static void ShowUsage( PrintStream out ) {
	out.println( "Usage: java splitindex [OPTION]... RAWINDEXFILE [MAKEINDEXOPTION]..." );
    }

    private static void ShowUsage() {
	ShowUsage( System.out );
    }

    private static void UsageError( String msg ) {
	System.err.println( msg );
	System.err.println( "Try `java splitindex --help' for more information." );
	System.exit( 1 );
    }

    private static void ScanArguments(String[] args) {
	String MakeIndex = "makeindex";
	for (int i = 0; i < args.length; i++) {
	    if ( args[i].charAt(0) == '-' ) {
		// Option
		if ( args[i].charAt(1) == '-' ) {
		    // Long Option
		    if ( args[i].substring(2).equals( "help" ) ) {
			ShowHelp();
			System.exit(0);
		    } else if ( args[i].substring(2).equals( "version" ) ) {
			ShowVersion();
			System.exit(0);
		    } else if ( args[i].substring(2).equals( "verbose" ) ) {
			Verbose++;
		    } else if ( args[i].substring(2).equals( "makeindex" ) ) {
			if ( ++i >= args.length ) {
			    UsageError( "Option makeindex requires an argument" );
			}
			MakeIndex = args[i];
		    } else if ( ( args[i].length() >= 11 ) && 
				( args[i].substring(2,11).equals( "makeindex=" ) ) ) {
			MakeIndex = args[i].substring(12);
		    } else if ( args[i].substring(2).equals( "identify" ) ) {
			if ( ++i >= args.length ) {
			    UsageError( "Option identify requires an argument" );
			}
		        Identify = args[i];
		    } else if ( ( args[i].length() >= 10 ) && 
				( args[i].substring(2,10).equals( "identify=" ) ) ) {
			Identify = args[i].substring(11);
		    } else if ( args[i].substring(2).equals( "resultis" ) ) {
			if ( ++i >= args.length ) {
			    UsageError( "Option resultis requires an argument" );
			}
			ResultIs = args[i];
		    } else if ( ( args[i].length() >= 10 ) && 
				( args[i].substring(2,10).equals( "resultis=" ) ) ) {
			ResultIs = args[i].substring(11);
		    } else if ( args[i].substring(2).equals( "suffixis" ) ) {
			if ( ++i >= args.length ) {
			    UsageError( "Option suffixis requires an argument" );
			}
			SuffixIs = args[i];
		    } else if ( ( args[i].length() >= 10 ) && 
				( args[i].substring(2,10).equals( "suffixis=" ) ) ) {
			SuffixIs = args[i].substring(11);
		    } else if ( args[i].equals( "--" ) ) {
			while ( ++i < args.length ) {
			    MakeIndexArgs.add( args[i] );
			}
		    } else {
			UsageError( "Unknown option " + args[i].substring(2) );
		    }
		} else {
		    // Short Option
		    for ( int n = 1; n < args[i].length(); ) {
			switch( args[i].charAt(n++) ) {
			    case 'h':
				ShowHelp();
				System.exit(0);
			    case 'm':
				if ( n >= args[i].length() ) {
				    if ( ++i >= args.length ) {
					UsageError( "Option makeindex requires an argument" );
				    } else {
					MakeIndex = args[i];
					n = args[i].length();
				    }
				} else {
				    MakeIndex = args[i].substring( n );
				    n = args[i].length();
				}
				break;
			    case 'i':
				if ( n >= args[i].length() ) {
				    if ( ++i >= args.length ) {
					UsageError( "Option identify requires an argument" );
				    } else {
					Identify = args[i];
					n = args[i].length();
				    }
				} else {
				    Identify = args[i].substring( n );
				    n = args[i].length();
				}
				break;
			    case 'r':
				if ( n >= args[i].length() ) {
				    if ( ++i >= args.length ) {
					UsageError( "Option resultis requires an argument" );
				    } else {
				        ResultIs = args[i];
					n = args[i].length();
				    }
				} else {
				    ResultIs = args[i].substring( n );
				    n = args[i].length();
				}
				break;
			    case 's':
				if ( n >= args[i].length() ) {
				    if ( ++i >= args.length ) {
					UsageError( "Option suffixis requires an argument" );
				    } else {
					SuffixIs = args[i];
					n = args[i].length();
				    }
				} else {
				    SuffixIs = args[i].substring( n );
				    n = args[i].length();
				}
				break;
			    case 'v':
				Verbose++;
				break;
			}
		    }
		}
	    } else {
		MakeIndexArgs.add( args[i] );
	    }
	}

	// Args --> IDX + Stringarray
	if ( MakeIndexArgs.isEmpty() ) {
	    UsageError( "missing raw index file" );
	} else {
	    IDX = (String)MakeIndexArgs.get(0);
	    MakeIndexArgs.remove(0);
	    MakeIndexArgs.add( 0, MakeIndex );
	}

	if ( IDX.endsWith( ".idx" ) ) {
	    Jobname = IDX.substring( 0, IDX.length() - 4 );
	} else {
	    Jobname = IDX;
	}
    }

    public static void main(String[] args) {
	ScanArguments(args);

	if ( Verbose > 0 ) {
	    ShowVersion();
	    System.out.println();
	    if ( Verbose > 9 ) {
		System.out.println( "Identify:  \"" + Identify + "\"" );
		System.out.println( "ResultIs:  \"" + ResultIs + "\"" );
		System.out.println( "SuffixIs:  \"" + SuffixIs + "\"" );
		System.out.println( "IDX:       \"" + IDX + "\"" );
		System.out.println( "Jobname:   \"" + Jobname + "\"" );
		System.out.print( "MakeIndex:" );
		for ( int i = 0; i < MakeIndexArgs.size(); i++ )
		    System.out.print( " \"" + (String)MakeIndexArgs.get(i) + "\"" );
		System.out.println();
	    }
	}

	ProcessIDXFile();
    }

    private static void ProcessIDXFile() {
	File fIDX = new File( IDX );
	LineNumberReader rIDX = null;
	boolean error = false;
	if ( !fIDX.canRead() ) {
	    if ( IDX.equals( Jobname ) ) {
		IDX = IDX.concat( ".idx" );
		fIDX = new File( IDX );
		if ( !fIDX.canRead() ) {
		    System.err.println( "Can read neither file " + Jobname +
					" nor file " + IDX );
		    System.exit( 1 );
		}
	    } else {
		System.err.println( "Can't read file " + Jobname );
		System.exit( 1 );
	    }
	}
	
	try {
	    FileReader reader = new FileReader( fIDX );
	    rIDX = new LineNumberReader( reader );
	} catch ( FileNotFoundException ex ) {
	    System.err.println( ex.getMessage() );
	    System.exit( 1 );
	}
    
	try {
	    Pattern search = Pattern.compile( Identify );
	    while ( rIDX.ready() ) {
		String line = rIDX.readLine();
		Matcher match = search.matcher( line );
		String suffix, result;
		
		try {
 		    if ( match.find() ) {
 			suffix = match.replaceFirst( SuffixIs );
 			result = match.replaceFirst( ResultIs );
 		    } else {
 			result = line;
 			suffix = SuffixIs.replaceFirst( "\\$\\d", "idx" );
 		    }
		    WriteToIndex( Jobname + suffix + ".idx", result );
		} catch ( Exception ex ) {
		    System.err.println( ex.getMessage() );
		    error = true;
		    break;
		}
	    }

	    if ( ! CloseAllIndex() )
		error = true;
	    else if ( ! CallAllMakeIndex() )
		error = true;
	} catch ( IOException ex ) {
	    System.err.println( ex.getMessage() );
	}

	try {
	    rIDX.close();
	} catch ( IOException ex ) {
	    System.err.println( ex.getMessage() );
	    System.exit( 1 );
	}

	if ( error )
	    System.exit( 1 );

    }

    static void WriteToIndex( String Name, String line ) 
	throws FileNotFoundException, SecurityException {
	PrintWriter fOut;
	if ( ( fOut = (PrintWriter)IDXwriters.get( Name ) ) == null ) {
	    if ( Verbose > 1 ) {
		System.out.println( "New index file " + Name );
	    }
	    fOut = new PrintWriter( new FileOutputStream( Name ) );
	    IDXwriters.put( Name, fOut );
	}
	fOut.println( line );
    }

    static boolean CloseAllIndex() {
	Iterator all = IDXwriters.entrySet().iterator();
	boolean retVal = true;
	while ( all.hasNext() ) {
	    Map.Entry entry = (Map.Entry)all.next();
	    PrintWriter writer = (PrintWriter)entry.getValue();
	    if ( Verbose > 1 ) {
		System.out.println( "Close " + entry.getKey() );
	    }
	    writer.close();
	    if ( writer.checkError() ) {
		System.err.println( "Error writing " + entry.getKey() );
		retVal = false;
	    }
	}
	return retVal;
    }

    static boolean CallAllMakeIndex() {
	Iterator all = IDXwriters.entrySet().iterator();
	boolean retVal = true;
	ArrayList processes = new ArrayList();
	while ( all.hasNext() ) {
	    Map.Entry entry = (Map.Entry)all.next();
	    String name = (String)entry.getKey();
	    try {
		MakeIndexArgs.add(name);
		String Args[] = new String[MakeIndexArgs.size()];
		Args = (String[])MakeIndexArgs.toArray( Args );
		MakeIndexArgs.remove(MakeIndexArgs.size()-1);
		if ( Verbose > 1 ) {
		    System.out.print( "MakeIndex:" );
		    for ( int i = 0; i < Args.length; i++ )
			System.out.print( " \"" + Args[i] + "\"" );
		    System.out.println();
		}
		processes.add(Runtime.getRuntime().exec( Args ));
	    } catch ( Exception ex ) {
		System.err.println( ex.getMessage() );
		retVal = false;
	    }
	}

	for ( int i = 0; i < processes.size(); i++ ) {
	    Process p = (Process)processes.get( i );
	    InputStream out = p.getInputStream();
	    byte[] buffer = new byte[1024];
	    for ( boolean oncemore = true; oncemore; ) {
		oncemore = false;
		try {
		    while ( out.available() > 0 ) {
			out.read( buffer );
			System.out.print( new String(buffer) );
		    }
		    for ( out = p.getErrorStream();
			  out.available() > 0; ) {
			out.read( buffer );
			System.err.print( new String( buffer ) );
		    }
		} catch ( Exception ex ) {
		    System.err.println( ex.getMessage() );
		    retVal = false;
		}
		try {
		    if ( p.exitValue() != 0 )
			retVal = false;
		} catch ( IllegalThreadStateException ex ) {
		    oncemore = true;
		}
	    }
	}
	
	return retVal;
    }
}
