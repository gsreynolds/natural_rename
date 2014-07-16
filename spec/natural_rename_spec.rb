require 'spec_helper'

describe NaturalRename do
  context 'slide names' do
    before do
      @files = []
      ('1'..'65').each do |i|
        file_name = "Slide#{i.rjust(2, '0')}.png"
        FileUtils.touch(file_name)
        @files << file_name
      end
      # Shuffle the file list
      @files.shuffle
      @natural_rename = NaturalRename.new(files: @files, verbose: false)
    end

    it 'should sort the file list' do
      a = %w(Slide01.png Slide02.png Slide03.png Slide04.png Slide05.png Slide06.png Slide07.png Slide08.png Slide09.png Slide10.png Slide11.png Slide12.png Slide13.png Slide14.png Slide15.png Slide16.png Slide17.png Slide18.png Slide19.png Slide20.png Slide21.png Slide22.png Slide23.png Slide24.png Slide25.png Slide26.png Slide27.png Slide28.png Slide29.png Slide30.png Slide31.png Slide32.png Slide33.png Slide34.png Slide35.png Slide36.png Slide37.png Slide38.png Slide39.png Slide40.png Slide41.png Slide42.png Slide43.png Slide44.png Slide45.png Slide46.png Slide47.png Slide48.png Slide49.png Slide50.png Slide51.png Slide52.png Slide53.png Slide54.png Slide55.png Slide56.png Slide57.png Slide58.png Slide59.png Slide60.png Slide61.png Slide62.png Slide63.png Slide64.png Slide65.png)
      expect(@natural_rename.files).to eq(a)
    end

    it 'should generate new names in multiples of 26' do
      a = %w(AA AB AC AD AE AF AG AH AI AJ AK AL AM AN AO AP AQ AR AS AT AU AV AW AX AY AZ BA BB BC BD BE BF BG BH BI BJ BK BL BM BN BO BP BQ BR BS BT BU BV BW BX BY BZ CA CB CC CD CE CF CG CH CI CJ CK CL CM CN CO CP CQ CR CS CT CU CV CW CX CY CZ)
      expect(@natural_rename.new_names).to eq(a)
    end

    it 'should apply new names' do
      a = %w(/AA.png /AB.png /AC.png /AD.png /AE.png /AF.png /AG.png /AH.png /AI.png /AJ.png /AK.png /AL.png /AM.png /AN.png /AO.png /AP.png /AQ.png /AR.png /AS.png /AT.png /AU.png /AV.png /AW.png /AX.png /AY.png /AZ.png /BA.png /BB.png /BC.png /BD.png /BE.png /BF.png /BG.png /BH.png /BI.png /BJ.png /BK.png /BL.png /BM.png /BN.png /BO.png /BP.png /BQ.png /BR.png /BS.png /BT.png /BU.png /BV.png /BW.png /BX.png /BY.png /BZ.png /CA.png /CB.png /CC.png /CD.png /CE.png /CF.png /CG.png /CH.png /CI.png /CJ.png /CK.png /CL.png /CM.png)
      @natural_rename.rename
      expect(Dir.glob('*')).to eq(a)
    end

    it 'should be in correct order' do
      File.open('Slide01.png', 'w') { |f| f.write 'First' }
      File.open('Slide10.png', 'w') { |f| f.write 'Tenth' }
      File.open('Slide40.png', 'w') { |f| f.write 'Fortieth' }
      File.open('Slide65.png', 'w') { |f| f.write 'Last' }
      @natural_rename.rename
      expect(File.read('AA.png')).to match 'First'
      expect(File.read('AJ.png')).to match 'Tenth'
      expect(File.read('BN.png')).to match 'Fortieth'
      expect(File.read('CM.png')).to match 'Last'
    end
  end
end
