MODULE JoDiff;
IMPORT Files, Out, Args, Strings;
CONST version = '1.0.0';

VAR
  fnameA, fnameB: ARRAY 256 OF CHAR; (** File names of compared files *)
  rA, rB: Files.Rider; (* Riders on files A and B *)


PROCEDURE Compare;
VAR a, b: CHAR;
BEGIN
  Files.ReadChar(rA, a); Files.ReadChar(rB, b);
  WHILE ~rA.eof & ~rB.eof DO
    IF a # b THEN
      Out.Char(b)
    END;
    Files.ReadChar(rA, a); Files.ReadChar(rB, b)
  END;
  Out.Ln;

  IF ~rA.eof THEN
    Out.Ln;
    Out.String('File A is longer than file B.'); Out.Ln
  ELSIF ~rB.eof THEN
    Out.Ln;
    Out.String('File B is longer than file A.'); Out.Ln
  END
END Compare;

PROCEDURE Run;
VAR fA, fB: Files.File;
BEGIN
  fA := Files.Old(fnameA);
  fB := Files.Old(fnameB);
  IF fA = NIL THEN
    Out.String('Error: Could not open file A'); Out.Ln
  ELSIF fB = NIL THEN
    Out.String('Error: Could not open file B'); Out.Ln
  ELSE
    Files.Set(rA, fA, 0);
    Files.Set(rB, fB, 0);
    Compare
  END
END Run;

PROCEDURE Usage;
VAR s: ARRAY 256 OF CHAR;
BEGIN
  Out.String('JoDiff, v'); Out.String(version); Out.Ln;
  Out.String('Compares two UTF8-text files, outputting all characters of the second file'); Out.Ln;
  Out.String('that are different from the characters in the same place of the first file.'); Out.Ln;
  Out.String('The program is used to find the smallest changes in a file.'); Out.Ln; Out.Ln;
  Out.String('Usage:'); Out.Ln;
  Out.String('  '); Args.Get(0, s); Out.String(s);
  Out.String(' <fileA> <fileB>'); Out.Ln; Out.Ln;
  Out.String('  fileA - the first text file'); Out.Ln;
  Out.String('  fileB - the second text file'); Out.Ln; Out.Ln
END Usage;

PROCEDURE Do;
VAR i: INTEGER;
  s, outFile: ARRAY 256 OF CHAR;
BEGIN
  IF Args.Count() # 2 THEN
    Usage
  ELSE
    Args.Get(1, fnameA);
    Args.Get(2, fnameB);
    Run
  END
END Do;

BEGIN
  Do
END JoDiff.