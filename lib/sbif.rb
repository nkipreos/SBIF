require 'net/http'
require 'json'
require 'date'

class SBIF

  def initialize(api_key)
    @base_url = "http://api.sbif.cl/api-sbifv3/recursos_api/%{indicator}?apikey=#{api_key}&formato=json"
  end

  def uf
    url = URI(@base_url % {indicator: 'uf'})
    {'Valor': JSON.parse(Net::HTTP.get(url))['UFs'][0]['Valor']}
  end

  def dolar
    url = URI(@base_url % {indicator: 'dolar'})
    {'Valor': JSON.parse(Net::HTTP.get(url))['Dolares'][0]['Valor']}
  end

  def ipc
    url = URI(@base_url % {indicator: 'ipc'})
    {'Valor': JSON.parse(Net::HTTP.get(url))['IPCs'][0]['Valor']}
  end

  def tmc
    url = URI(@base_url % {indicator: "tmc/#{Date.today.year}"})
    tmcs = []
    JSON.parse(Net::HTTP.get(url))['TMCs'].each do |tmc|
      tmcs << {'Tasa': "#{tmc['Titulo']}|#{tmc['SubTitulo']}", 'Valor': tmc['Valor'] }
    end
    tmcs
  end

  def euro
    url = URI(@base_url % {indicator: 'euro'})
    {'Valor': JSON.parse(Net::HTTP.get(url))['Euros'][0]['Valor']}
  end

  def utm
    url = URI(@base_url % {indicator: 'utm'})
    {'Valor': JSON.parse(Net::HTTP.get(url))['UTMs'][0]['Valor']}
  end

end