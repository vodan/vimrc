command! -nargs=* -range -complete=customlist,<SID>CompleteTabularizeCommand
   \ T <line1>,<line2>call Tabularize(<q-args>)

