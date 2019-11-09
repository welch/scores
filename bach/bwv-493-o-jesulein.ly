\version "2.18.2"
\paper {
  top-margin = 0.5\in
  bottom-margin = 0.5\in
  left-margin = 0.75\in
  print-page-number = #f
  %annotate-spacing = ##t
}

global = {
  \key bes \major
  \time 3/4
  \dynamicUp
}

\header {
  title = "O Jesulein süß"
  composer = "J. S. Bach"
  opus = "BWV 493"
  tagline = ""
}

verseOne = \lyricmode {
  O Je -- su -- lein süß, __ o Je -- su -- lein mild! Deins
  Va -- ters Wil -- len hast du __ er -- füllt, bist
  kom -- men aus dem Him -- mel -- reich, uns
  ar -- men Men -- schen wor -- den gleich. O
  Je -- su -- lein süß, o Je -- su -- lein mild!
}

verseTwoBringet = \lyricmode {
  \override LyricHyphen.minimum-distance = #1.0 % Ensure hyphens are visible
  O Je -- su -- lein süß, __ o Je -- su -- lein mild! Deins
  Va -- ters __ Zorn __ hast du __ ges -- tillt, du
  zahlst __ für uns __ all un -- ser Schuld und
  bring -- et uns in __ deins Va -- ters Huld. O
  Je -- su -- lein süß, o Je -- su -- lein mild!
}

verseTwoBringt = \lyricmode {
  O Je -- su -- lein süß, __ o Je -- su -- lein mild! Deins
  Va -- ters __ Zorn __ hast du __ ges -- tillt, du
  zahlst __ für uns __ all un -- ser Schuld und
  bringt uns in __ deins Va -- ters Huld. O
  Je -- su -- lein süß, o Je -- su -- lein mild!
}

sopranoVerseNotes =
#(define-music-function
     (parser location mSixNotes bar)
     (ly:music? ly:music?)
   #{
  \relative c'' {
  \partial 4 bes4 | bes4. a8 bes4 | c2 a4 | bes a g | f2\fermata d'4 |
  c2 c4 | #mSixNotes  | f,( g) a | bes2\fermata d4 |
  ees2 ees4 | c2 c4 | d2 d4 | bes2\fermata bes4 |
  c2 c4 | a2 a4 | bes2 bes4 | g2\fermata c4 |
  f,4 g a | bes2 d4 | c4. bes8 a4 | bes2\fermata #bar
}
   #})

altoVerseNotes =
#(define-music-function
     (parser location mSixNotes mThirtyThreeNotes bar)
     (ly:music? ly:music? ly:music?)
   #{
  \relative c'' {
  \partial 4 d,4 | d8( e) fis4 g | g8( f e4) f4 | f4. d8 e4 | c2\fermata f4 |
  f4.( ees8) d([ a']) | #mSixNotes | f2 ees4 | d2\fermata f4 |
  ees8( f g4) g | f2 f8( g) | aes4( bes8 aes) g([ f]) | g2\fermata g4 |
  #mThirtyThreeNotes | g( f8 e) f4 | bes,8( c d ees) f4 | f( ees)\fermata ees |
  d8( c) bes4 c | f2 f4 | g8( f) ees4. ees8 | d2\fermata #bar
}
   #})

tenorVerseNotes =
#(define-music-function
     (parser location mSixNotes bar)
     (ly:music? ly:music?)
   #{
  \relative c' {
  \clef "G_8"
  \partial 4 bes8( a) | bes4 d d | c2 c4 | d4. d8 g,([ c]) | a2\fermata bes4 |
  bes4( a) d | #mSixNotes | d2 c4 | bes2\fermata bes4 |
  bes4.( c8) bes4 | bes4( a8 bes) c4 | bes2 aes4 | g2\fermata d'4 |
  c2 c4 | c2 c4 | f,2 bes4 | bes2\fermata a4 |
  bes8( a) g4 f4 | f2 bes4 | bes( ees8) d c4 | bes2\fermata #bar
}
   #})

bassVerseNotes = #(define-music-function
     (parser location mSixNotes mThirtyThreeNotes bar)
     (ly:music? ly:music? ly:music?)
   #{
  \relative c' {
  \clef bass
  \partial 4 bes8( a) | g4 d g8( f) | e( d c4) f4 | d4 bes4 c | f2\fermata bes,4 |
  f'8( e f4) fis | #mSixNotes | bes( ees,) f | bes,2\fermata bes'8( a) |
  g4( ees) c | f2 a8( g) | f4( d) bes | ees2\fermata g8( f) |
  #mThirtyThreeNotes | f2 f8( ees) | d4( bes) d | ees2\fermata c4 |
  d4 ees8([ d]) ees( c) | d4 ees8( d c bes) | ees4 c f bes,2\fermata #bar
}
   #})

\score {
  \new ChoirStaff \with {
        % Reduce stem length and line spacing to match
        \override StaffSymbol.staff-space = #(magstep -1)
        fontSize = #-1
      }
  <<
  \accidentalStyle Score.modern-voice-cautionary
  % i want all measures numbered at their starting bar
  \override Score.BarNumber.break-visibility = ##(#f #t #t)

    \new Staff \with {  instrumentName = #"S" } <<
      \new Voice = "soprano" <<
        \global
        \sopranoVerseNotes { bes4 bes c } \bar "||"
      >>
      \lyricsto "soprano" \new Lyrics \verseOne
    >>
    \new Staff \with {  instrumentName = #"A" }<<
      \new Voice = "alto" <<
        \global
        \altoVerseNotes { a4. g8 f4 } { g4( e8 f) g4 } \bar "||"
      >>
      \lyricsto "alto" \new Lyrics \verseOne
    >>
    \new Staff \with {  instrumentName = #"T" }<<
      \new Voice = "tenor" <<
        \global
        \tenorVerseNotes {d ees4. ees8}  \bar "||"
      >>
      \lyricsto "tenor" \new Lyrics \verseOne
    >>
    \new Staff \with {  instrumentName = #"B" }<<
      \new Voice = "bass" <<
        \global
        \bassVerseNotes {g8( fis) g4 a}  { e4( c) e } \bar "||"
      >>
      \lyricsto "bass" \new Lyrics \verseOne
    >>
  >>
  \header { piece = "Verse 1" }
  \layout {
  }
  \midi { }
}

\score {
  \new ChoirStaff \with {
        % Reduce stem length and line spacing to match
        \override StaffSymbol.staff-space = #(magstep -1)
        fontSize = #-1
      }
  <<
  \accidentalStyle Score.modern-voice-cautionary
  % i want all measures numbered at their starting bar
  \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \set Score.currentBarNumber = #21

    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranoVerseNotes { bes2 c4 } \bar "|."
      >>
      \lyricsto "soprano" \new Lyrics \verseTwoBringt
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altoVerseNotes {a4.( g8) f4 } { g4 e8( f) g4 } \bar "|."
      >>
      \lyricsto "alto" \new Lyrics \verseTwoBringet
    >>
    \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenorVerseNotes {d( ees4.) ees8} \bar "|."
      >>
      \lyricsto "tenor" \new Lyrics \verseTwoBringt
    >>
    \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassVerseNotes {g8( fis g4) a} { e4 c e }\bar "|."
      >>
      \lyricsto "bass" \new Lyrics \verseTwoBringet
    >>
  >>
  \header { piece = "Verse 2" }
  \layout {
  }
  \midi { }
}
