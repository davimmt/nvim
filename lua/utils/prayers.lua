local prayers = {
	{
		"Santo Deus, Santo Forte, Santo Imortal, tem piedade de nós.",
	},

	{
		"    Святы́й Бо́же, Святы́й Кре́пкий, Святы́й Безсме́ртный, поми́луй нас.",
	},

	{
		"Glória ao Pai e ao Filho e ao Espírito Santo, e agora e sempre, e pelos séculos dos séculos. Amém.",
	},

	{
		"  Сла́ва Отцу́ и Сы́ну и Свято́му Ду́ху, и ны́не и при́сно и во ве́ки веко́в. Ами́нь.",
	},

	{
		"Jesus Cristo, Filho de Deus, tem piedade de mim, pecador.",
	},

	{
		"Senhor, tem piedade.",
	},

	{
		"Santíssima Mãe de Deus, salva-nos!",
	},

	{
		"  Mais honrada que os Querubins, e incomparavelmente mais gloriosa que os Sefarins,",
		"sem corrupção deste luz ao Deus Verbo. Verdadeira Mãe de Deus, nós te magnificamos.",
	},

	{
		"É digno, em verdade, bendizer-te, ó sempre bem-aventurada e toda-imaculada Mãe do nosso Deus.",
	},

	{
		"   Яко Твое есть Царство, и сила, и слава, Отца, и Сына, и Святаго Духа,",
		"и ныне и присно, и во веки веков. Аминь.",
	},

	{
		"    Царю́ Небе́сный, Уте́шителю, Ду́ше и́стины, И́же везде́ сый и вся исполня́яй,",
		" Сокро́вище благи́х и жи́зни Пода́телю, прииди́ и всели́ся в ны,",
		" и очи́сти ны от вся́кия скве́рны, и спаси́, Бла́же, ду́ши на́ша.",
	},

	{
		"Достойно есть, яко воистину, блажити Тя Богородицу, присноблаженную и пренепорочную,",
		"и Матерь Бога нашего. Честнѣйшую херувимъ и славнѣйшую безъ сравненія серафимъ,",
		"безъ истлѣнія Бога Слова рождшую, сущую Богородицу Тя величаемъ.",
	},

	{
		"      Спаси́, Го́споди, лю́ди Твоя́, и благослови́ достоя́ние Твое́,",
		"    побе́ды православным христианом на сопроти́вныя да́руя,",
		"  и Твое́ сохраня́я Кресто́м Твои́м жи́тельство.",
	},
	{
		"    Слава Тебе показавшему нам свет.",
		"  Сла́ва в вы́шних Бо́гу, и на земли́ мир, в челове́цех благоволе́ние."
	},
}

-- http://lua-users.org/wiki/MathLibraryTutorial
math.randomseed(os.time())
math.random()
math.random()
math.random()

return prayers[math.random(#prayers)]
