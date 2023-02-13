     *****************************************************************   
     *                      R P G                                    *        
     *    ------------------------------------------------------     *        
     *                                                               *        
     *    Various Date And Time Calculations In RPGLE                *      
     *                                                               *        
     *    ------------------------------------------------------     *        
     *    FEBRUAR 2023        (c) Copyright by Datanymics GmbH     *        
     *****************************************************************   

     h Datfmt(*eur) Timfmt(*hms:)

     d Date_Eur        s               d   inz(d'22.01.2003')
     d Date_today      s               d

     d Time_hms        s               t   inz(t'08:00:00')
     d Time_Now        s               t

     d Time_Stamp      s               z

     d Date_char6      s              6
     d Date_char8      s              8
     d Date_char10     s             10

     d Date_Num6       s              6  0
     d Date_Num8       s              8  0
     d Date_Num10      s             10  0

     d Time_char6      s              6
     d Time_char8      s              8

     d Time_Num4       s              4  0
     d Time_Num6       s              6  0
     d Time_Num8       s              8  0

     d Years           s              9  0
     d Months          s              9  0
     d Days            s              9  0
     d Hours           s              9  0
     d Minutes         s              9  0
     d Seconds         s              9  0

      *---------------------------------------------------------------------
      * ALPHA Felder in Datum übertragen
      *---------------------------------------------------------------------

      * '220103' in Datumsfeld

     c                   eval      Date_Char6='220103'
     c     *dmy0         Test(de)                Date_Char6
     c                   if        not %Error
     c                   eval      Date_eur=%Date(Date_Char6:*dmy0)
     c                   endif

      * '22 01 03' in Datumsfeld

     c                   eval      Date_Char8='22 01 03'
     c     *dmy&         Test(de)                Date_Char8
     c                   if        not %Error
     c                   eval      Date_eur=%Date(Date_Char8:*dmy&)
     c                   endif

      * '22012003' in Datumsfeld

     c                   eval      Date_Char8='22012003'
     c     *eur0         Test(de)                Date_Char8
     c                   if        not %Error
     c                   eval      Date_eur=%Date(Date_Char8:*eur0)
     c                   endif

     c                   eval      *inlr=*on

      * '22.01.2003' in Datumsfeld

     c                   eval      Date_Char8='22012003'
     c     *eur0         Test(de)                Date_Char8
     c                   if        not %Error
     c                   eval      Date_eur=%Date(Date_Char8:*eur0)
     c                   endif

      *---------------------------------------------------------------------
      * NUMERISCHE Felder in Datum übertragen
      *---------------------------------------------------------------------

      * 220103 in Datumsfeld

     c                   eval      Date_Num6=220103
     c     *dmy          Test(de)                Date_Num6
     c                   if        not %Error
     c                   eval      Date_eur=%Date(Date_Num6:*dmy)
     c                   endif

      * 20030122 in Datumsfeld

     c                   eval      Date_Num8=20030122
     c     *iso          Test(de)                Date_Num8
     c                   if        not %Error
     c                   eval      Date_eur=%Date(Date_Num8:*iso)
     c                   endif

      *---------------------------------------------------------------------
      * Aktuelles Datum in Datumsfeld übertragen
      *---------------------------------------------------------------------

     c                   eval      Date_today=%Date

      *---------------------------------------------------------------------
      * Addieren Tag, Monat, Jahr zu Datum
      *---------------------------------------------------------------------

     c                   eval      Date_eur=%date+%days(30)+%months(9)
     c                   eval      Date_eur=Date_eur+%years(2)

      *---------------------------------------------------------------------
      * Subtrahieren Tag, Monat, Jahr zu Datum
      *---------------------------------------------------------------------

     c                   eval      Date_eur=%date-%days(30)-%months(9)
     c                   eval      Date_eur=Date_eur-%years(2)

      *---------------------------------------------------------------------
      * Differenz zwischen 2 Daten
      *---------------------------------------------------------------------

     c                   eval      Days=%diff(%date:Date_Eur:*days)
     c                   eval      Years=%diff(%date:Date_Eur:*years)

      *---------------------------------------------------------------------
      * Tag, Monat, Jahr aus einem Datum holen
      *---------------------------------------------------------------------

     c                   eval      Days=%subdt(%date:*days)
     c                   eval      Years=%subdt(%date:*Years)
      /eject

      *---------------------------------------------------------------------
      * ALPHA Felder in Zeit übertragen
      *---------------------------------------------------------------------

      * '081201' in Zeitfeld

     c                   eval      Time_Char6='081201'
     c     *hms0         Test(te)                Time_Char6
     c                   if        not %Error
     c                   eval      Time_hms=%Time(Time_Char6:*hms0)
     c                   endif

      * '08:12:01' in Zeitfeld

     c                   eval      Time_Char8='08:12:01'
     c     *hms:         Test(te)                Time_Char8
     c                   if        not %Error
     c                   eval      Time_hms=%Time(Time_Char8:*hms:)
     c                   endif

      *---------------------------------------------------------------------
      * NUMERISCHE Felder in Zeit übertragen
      *---------------------------------------------------------------------

      * 081201 in Zeitfeld

     c                   eval      Time_Num6=081201
     c     *hms          Test(te)                Time_Num6
     c                   if        not %Error
     c                   eval      Time_hms=%Time(Time_Num6:*hms)
     c                   endif

      * 0812 in Zeitfeld

     c                   eval      Time_Num4=0812
     c                   eval      Time_Num6=Time_Num4*100
     c     *hms          Test(te)                Time_Num6
     c                   if        not %Error
     c                   eval      Time_hms=%Time(Time_Num6:*hms)
     c                   endif

      *---------------------------------------------------------------------
      * Aktuelle Zeit in Zeitfeld übertragen
      *---------------------------------------------------------------------

     c                   eval      Time_Now=%Time

      *---------------------------------------------------------------------
      * Aktuelles Datum und aktuelle Zeit in Zeitmarke übertragen
      *---------------------------------------------------------------------

     c                   eval      Time_Stamp=%TimeStamp

      *---------------------------------------------------------------------
      * Addieren Sekunden, Minuten, Stunden zu einer Zeit
      *---------------------------------------------------------------------

     c                   eval      Time_hms=%time+%seconds(30)+%minutes(9)
     c                   eval      Time_hms=Time_hms+%hours(2)

      *---------------------------------------------------------------------
      * Subtrahieren Sekunden, Minuten, Stunden einer Zeit
      *---------------------------------------------------------------------

     c                   eval      Time_hms=%time-%seconds(30)-%minutes(9)
     c                   eval      Time_hms=Time_hms-%hours(2)

      *---------------------------------------------------------------------
      * Differenz zwischen 2 Zeiten oder Zeitmarken
      *---------------------------------------------------------------------

     c                   eval      Minutes=%diff(%Time:Time_hms:*minutes)
     c                   eval      Hours=%diff(%Time:Time_hms:*hours)
     c                   eval      Seconds=%diff(%Timestamp:Time_hms:*seconds)

      *---------------------------------------------------------------------
      * Sekunden, Minuten, Stunden aus einer Zeit oder Zeitmarke
      *---------------------------------------------------------------------

     c                   eval      Minutes=%subdt(%time:*Minutes)
     c                   eval      Hours=%subdt(%time:*Hours)
     c                   eval      Seconds=%subdt(%Timestamp:*seconds)

      * Zeitfeld in 4 stelliges num. Feld

     c                   eval      Time_hms=T'08:12:00'
     c                   eval      Time_Num4=(%subdt(Time_hms:*hours)*100) +
     c                                        %subdt(Time_hms:*minutes)
