
Path = 'D:\yuanma\ת��\siam11\';                   % �������ݴ�ŵ��ļ���·��
File = dir(fullfile(Path,'*.txt'));  % ��ʾ�ļ��������з��Ϻ�׺��Ϊ.txt�ļ���������Ϣ
FileNames = {File.name}';            % ��ȡ���Ϻ�׺��Ϊ.txt�������ļ����ļ�����ת��Ϊn��1��

Length_Names = size(FileNames,1);    % ��ȡ����ȡ�����ļ��ĸ���
for k = 1 : Length_Names
    % ����·�����ļ����õ��������ļ�·��
    %matName = FileNames(k)
   
    K_Trace = strcat(Path, FileNames(k));
     caseFileName = K_Trace{1,1};
    [pathstr,name,suffix]=fileparts(caseFileName); % pathstr ���Ϊ E:\test ;  name ���Ϊ  test;suffix ���Ϊ  .txt
    % ��ȡ���ݣ���Ϊ������.txt��ʽ���ݣ�����ֱ����load()����)
    eval(['res=','load(K_Trace{1,1})',';']);
    savePath= strcat('D:\yuanma\ת��\mat11\.mat','');
    saveName =  strcat('','res');
    save(savePath,saveName);
    
    myMat = load(savePath);
    myMat.type='rect';
    info = whos(savePath);
   
    
    a=matfile(savePath);b=whos(a);c=b.size;
    
    myMat.len=c(1,1);
    myMat.annoBegin = 1;
    myMat.startFrame = 1;
    results{1} = myMat; 
    
    
    
    save(savePath,'results');
    
    
    % load(K_Trace)
    % ע��1��eval()�����������ڵ����ݰ���������ִ�У�
    %       ��eval(['a','=''2','+','3',';'])ʵ��Ϊa = 2 + 3;
    % ע��2������K_Trace��Ԫ�������ʽ����Ҫ��{1,1}���ܵõ��ַ���
end

% txt = load('E:\pycharm\myTest\1.txt')
% save('E:\pycharm\myTest\test-1.mat','txt')