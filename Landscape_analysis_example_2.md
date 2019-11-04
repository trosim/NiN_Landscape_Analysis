Landscape analysis example
================
Trond Simensen
03 11 2019

### Analysis of variation of landscape properties

# Coastal plains

All four axes in the 4-dimensional GNMDS ordination of the KS457 dataset
were confirmed by DCA. GNMDS ordination had Procrustes SS = 0.0363 and
seven unstable OUs (which switched positions between the two best GNMDS
solutions).

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

There were no visible artifacts in the ordination charts. The
correlation analysis, the vector charts and the iso-line charts show a
strong first axis related to land use (infrastructure and agricultural
character) that appears to be conditioned by an underlying
geo-ecological gradient from inner to outer coast. Second axis is
strongly related to relief.

<table class="table table-condensed">

<thead>

<tr>

<th style="text-align:left;">

Variable

</th>

<th style="text-align:left;">

Description

</th>

<th style="text-align:center;">

GNMDS1

</th>

<th style="text-align:center;">

GNMDS2

</th>

<th style="text-align:center;">

GNMDS3

</th>

<th style="text-align:center;">

GNMDS4

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Gab\_nae

</td>

<td style="text-align:left;">

No commercial buildings

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.6345</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1164</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0294</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0092</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Gab\_fi

</td>

<td style="text-align:left;">

No fisheries-related buildings

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3166</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0682</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1576</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0607</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Gab\_a

</td>

<td style="text-align:left;">

PA built-up

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.7328</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0514</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0632</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0397</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Flat\_a

</td>

<td style="text-align:left;">

PA flat terrain

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0920</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">-0.5626</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2041</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1333</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Vmag\_a

</td>

<td style="text-align:left;">

PA regulated magazine

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0638</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0458</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0305</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0313</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Vei\_b\_a

</td>

<td style="text-align:left;">

PA road

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.6270</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0403</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0441</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0764</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Ktkmo\_a

</td>

<td style="text-align:left;">

PA thick layer of till

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2496</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0351</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0825</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2250</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Tpi1l\_a

</td>

<td style="text-align:left;">

PA depressions

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1171</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5584</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0046</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0476</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Tpi1h\_a

</td>

<td style="text-align:left;">

PA convex terrain

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0115</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4749</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2350</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2408</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Tpi1\_mp

</td>

<td style="text-align:left;">

Terrain form TPI1, numerical, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0787</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0753</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1994</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1974</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Stroms\_a

</td>

<td style="text-align:left;">

PA strong ocean current

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0130</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0281</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1729</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1029</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Stromn\_a

</td>

<td style="text-align:left;">

PA normal ocean current

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">-0.5201</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1313</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1621</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0064</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Stroml\_a

</td>

<td style="text-align:left;">

PA weak ocean current

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1040</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1434</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2647</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0612</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

River\_a

</td>

<td style="text-align:left;">

PA large river

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1955</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1176</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1526</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1342</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sti\_a

</td>

<td style="text-align:left;">

PA trail, path

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1018</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0506</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0624</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0061</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Steep\_a

</td>

<td style="text-align:left;">

PA steep terrain/slope

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0664</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.6571</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0831</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0625</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Kskred\_a

</td>

<td style="text-align:left;">

PA landslide soil

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0134</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2100</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3115</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1613</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Setr\_s

</td>

<td style="text-align:left;">

No summer mountain pasture

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1523</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0005</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0472</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0194</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sefr\_a

</td>

<td style="text-align:left;">

PA old buildings

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5703</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0920</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0622</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1033</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Rug3\_m

</td>

<td style="text-align:left;">

Terrain ruggedness VRM3, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0404</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.6617</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0259</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1666</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Rr1\_m

</td>

<td style="text-align:left;">

Altitudinal range

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0752</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.7185</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0293</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0011</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Brich\_a

</td>

<td style="text-align:left;">

PA lime-rich bedrock

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0159</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0992</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1475</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1324</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Bpoor\_a

</td>

<td style="text-align:left;">

PA lime-poor bedrock geology

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0641</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0189</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0535</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2003</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Rd\_anl\_a

</td>

<td style="text-align:left;">

PA reindeer husbandry facilities

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0533</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1007</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0276</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1174</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Bplu\_a

</td>

<td style="text-align:left;">

PA plutonic rock

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0541</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1586</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0252</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.3956</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Bvul\_a

</td>

<td style="text-align:left;">

PA volcanic rock

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1879</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0016</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0087</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1046</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Bavstn\_a

</td>

<td style="text-align:left;">

PA sedimentary rock

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1844</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1174</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1346</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1115</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Bomd\_a

</td>

<td style="text-align:left;">

PA metamorphic rock

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0386</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1951</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0493</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1713</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Land\_a

</td>

<td style="text-align:left;">

PA terrestrial area

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.6629</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0369</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0937</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1296</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Build\_a

</td>

<td style="text-align:left;">

PA built-up area

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4657</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1377</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0752</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0331</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

City\_a

</td>

<td style="text-align:left;">

PA town/city area

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1699</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0631</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1038</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0314</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Mire\_a

</td>

<td style="text-align:left;">

PA mire

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3114</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0618</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3063</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1761</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Meant\_a

</td>

<td style="text-align:left;">

PA moderate slope

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1062</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3618</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2532</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1399</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Maro\_s

</td>

<td style="text-align:left;">

No marine islands

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1609</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1324</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0874</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.4627</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Kmar\_a

</td>

<td style="text-align:left;">

PA marine deposits

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3888</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1691</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0652</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3365</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Lled\_a

</td>

<td style="text-align:left;">

PA power lines

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.6407</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0074</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0375</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0425</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Klac\_a

</td>

<td style="text-align:left;">

PA lacustrine deposits

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0278</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0492</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0674</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0588</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Kelv\_a

</td>

<td style="text-align:left;">

PA glaciofluvial deposits

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2298</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0004</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0094</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1849</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Kbf\_a

</td>

<td style="text-align:left;">

PA exposed bedrock

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">-0.5130</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1119</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1193</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1483</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Lake\_a

</td>

<td style="text-align:left;">

PA freshwater lake

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2853</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0324</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2846</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2841</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Innoy\_s

</td>

<td style="text-align:left;">

No freshwater lake islands

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2519</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0402</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1403</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2380</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Er\_m

</td>

<td style="text-align:left;">

Hydrographic index, ER, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1692</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0660</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1416</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2859</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

R\_net\_a

</td>

<td style="text-align:left;">

PA river

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5439</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1233</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1754</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0161</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Ekspve\_a

</td>

<td style="text-align:left;">

PA exposed coast

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.4350</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0564</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2315</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1983</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Ekspmo\_a

</td>

<td style="text-align:left;">

PA sligyhtly exposed coast

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.3992</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1357</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1847</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0639</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Ekspbe\_a

</td>

<td style="text-align:left;">

PA slightly protected coast

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0284</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0154</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2599</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0083</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Inns\_s

</td>

<td style="text-align:left;">

No lakes

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1119</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0461</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4004</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.3517</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cul\_u\_s

</td>

<td style="text-align:left;">

No cultural heritage sites outdoors

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2744</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1048</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1217</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0378</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cul\_t\_s

</td>

<td style="text-align:left;">

No technical heritage sites

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2435</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0028</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0328</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0082</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cul\_m\_s

</td>

<td style="text-align:left;">

No marine cultural heritage sites

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2090</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0296</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1025</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1863</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cul\_k\_s

</td>

<td style="text-align:left;">

No church ruins

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3534</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1442</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0394</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0059</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cul\_b\_s

</td>

<td style="text-align:left;">

No ancient rock art sites

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2314</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0738</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0586</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0975</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cul\_a\_s

</td>

<td style="text-align:left;">

No archeological heritage sites

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5134</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0412</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0209</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0436</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cre\_b\_a

</td>

<td style="text-align:left;">

PA steep coast

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0351</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5233</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2241</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0719</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cre\_f\_a

</td>

<td style="text-align:left;">

PA flat coast

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0716</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">-0.5412</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1673</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0322</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Crug3\_m

</td>

<td style="text-align:left;">

Coastal ruggedness, VRM3, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0147</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.6764</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0566</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0172</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Crug9\_m

</td>

<td style="text-align:left;">

Coastal ruggedness, coarse scale, VRM9, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0205</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.7286</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0134</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0165</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cr3\_u\_a

</td>

<td style="text-align:left;">

PA rugged coast

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0120</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5767</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0929</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0299</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Cr3\_r\_a

</td>

<td style="text-align:left;">

PA smooth/flat coast

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1328</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1676</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1194</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.3568</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Ccom\_m

</td>

<td style="text-align:left;">

Coastal complexity

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1233</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0012</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1075</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.4223</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

C\_kk\_a

</td>

<td style="text-align:left;">

PA complex coastline

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0370</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1276</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1500</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">-0.5028</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

C\_ek\_a

</td>

<td style="text-align:left;">

PA simple coastline Gab\_fi

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0708</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1907</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0039</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3369</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Bohei\_a

</td>

<td style="text-align:left;">

PA boreal heaths

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2844</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0965</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4234</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0554</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Asp\_s\_a

</td>

<td style="text-align:left;">

PA south facing terrain

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0277</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0953</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0417</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1100</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Asp\_n\_a

</td>

<td style="text-align:left;">

PA north facing terrain

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1435</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0227</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0876</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0632</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Abygg\_a

</td>

<td style="text-align:left;">

PA large buildings

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4676</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1406</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0750</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0371</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Araaf\_a

</td>

<td style="text-align:left;">

PA open areas

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2580</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0311</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3528</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1493</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Arbar\_a

</td>

<td style="text-align:left;">

PA coniferous forest

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5742</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0267</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1798</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1160</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Arbla\_a

</td>

<td style="text-align:left;">

PA mixed boreal forest

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5456</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0191</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2502</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0497</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Arfull\_a

</td>

<td style="text-align:left;">

PA arable land

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5974</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1116</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0122</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1307</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Arlov\_a

</td>

<td style="text-align:left;">

PA deciduous forest

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5743</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0956</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0356</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0475</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Arover\_a

</td>

<td style="text-align:left;">

PA surface cultivated land

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3461</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0327</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2269</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0626</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Dismire

</td>

<td style="text-align:left;">

Distance to mire, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.3504</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1510</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2023</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1649</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Dislake

</td>

<td style="text-align:left;">

Distance to lake, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.3049</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1074</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2768</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2448</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Discoast

</td>

<td style="text-align:left;">

Distance to coast, mean

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.3573</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0455</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2784</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2392</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Guro\_t\_a

</td>

<td style="text-align:left;">

PA rugged terrain

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0282</span>

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">0.5437</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2286</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0350</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Tpi6l\_a

</td>

<td style="text-align:left;">

PA rugged terrain, TPI6

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1665</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1377</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0645</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1714</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sn\_imp

</td>

<td style="text-align:left;">

PA impediment

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1980</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1446</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.2950</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1299</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sn\_flekk

</td>

<td style="text-align:left;">

PA patchy open treeless area

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1862</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1571</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4446</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0965</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sn\_lav

</td>

<td style="text-align:left;">

PA lichen heath

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1057</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0434</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0359</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0867</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sn\_torr

</td>

<td style="text-align:left;">

PA dry heath/open areas

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0046</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0888</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4795</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2194</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sn\_frisk

</td>

<td style="text-align:left;">

PA moist/fresh heath/open areas

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0485</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.0720</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.4784</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0170</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Sn\_ureg

</td>

<td style="text-align:left;">

PA unregistered heath/open areas

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">0.3218</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.2076</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0564</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">0.1267</span>

</td>

</tr>

<tr>

<td style="text-align:left;">

Oyst\_i

</td>

<td style="text-align:left;">

Inverse island
size

</td>

<td style="text-align:center;">

<span style="font-weight: bold; color: brown">-0.5057</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: black">-0.0913</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1215</span>

</td>

<td style="text-align:center;">

<span style="font-weight: plain; color: red">-0.1944</span>

</td>

</tr>

</tbody>

</table>

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

#### Complementary observations, axis 1 and 2:

  - One OU belongs to OI Class 6 (big city). This is Id 2916 Oslo city,
    which occupies the extreme position along GNMDS axis 1.
  - Agricultural intensity is associated with positive scores for GNMDS
    1, and a certain degree of infrastructure (similar to IfI ≈ 4) is a
    prerequisite for amount/degree of agricultural land use intensity.
    The relationship between JI and IfI is slightly unimodal, that is,
    the agricultural land use intensity is strongest when the
    amount/degree of infrastructure is relatively high, but decreases
    again when the amount/degree of infrastructure is very high.
  - The proportion of the area with deciduous forest (Arlov\_a) is 0 at
    the outer parts of the archipelago (SN = 5; there are 156 OUs with
    Arlov = 0), but increases inward towards larger islands and on the
    mainland.
  - The figure at the bottom left shows a clear (inverse) island size
    gradient, with a considerable variation in landscape characteristics
    related to the archipelago properties, first and foremost when the
    islands are smaller than 100 km2 (Oyst\_i \> 0.643). This opens the
    possibility that the complex gradient expressed on axis 1 is
    actually composed of two CLGs.
  - Among the 69 OUs in KS lacking infrastructure (IfI = 0), all of the
    56 as a largest island smaller than 1 km. Islands with significant
    infrastructure are generally much larger; one exception is Id 4038
    which has Oyst\_i = 0.8647 and IfI = 9.34. This polygon is located
    on the west and south part of Nøtterøy.
  - It is noteworthy that the topographic variables give such a strong
    signal when there is so little topography variation within costal
    plains.

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->

![](Landscape_analysis_example_2_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->
