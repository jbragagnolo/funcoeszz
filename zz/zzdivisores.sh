# ----------------------------------------------------------------------------
# Lista todos os divisores de um número inteiro e positivo, maior que 2.
#
# Uso: zzdivisores <número>
# Ex.: zzdivisores 1400
#
# Autor: Itamar <itamarnet (a) yahoo com br>
# Desde: 2013-03-25
# Versão: 4
# Licença: GPL
# ----------------------------------------------------------------------------
zzdivisores ()
{
	zzzz -h divisores "$1" && return

	test -n "$1" || { zztool -e uso divisores; return 1; }

	if zztool testa_numero "$1" && test $1 -ge 2
	then
		# Código adaptado a partir da solução em:
		# http://stackoverflow.com/questions/11699324/
		echo "$1" |
		awk '{
				i=2
				limits = sqrt($1)
				while (i <= limits) {
					if ($1 % i == 0) {
						result[i] = i
						ind = $1 / i
						if (i != ind ) { result[ind] = ind }
					}
					i++
				}
				asort(result)
				printf 1
				for (j in result) {
					printf " " result[j]
				}
				print " " $1
		}'
	else
		# Se não for um número válido exibe a ajuda
		zzdivisores -h
	fi
}
