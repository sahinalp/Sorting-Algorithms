classdef Sorting_algorithm_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        AlgorithmProjectUIFigure        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        tab_Menu                        matlab.ui.container.Tab
        Button                          matlab.ui.control.Button
        ahinAlpAkosmanLabel             matlab.ui.control.Label
        AlgorithmProjectLabel           matlab.ui.control.Label
        SpeedCompareProgramButton       matlab.ui.control.Button
        FibonacciFinderProgramButton    matlab.ui.control.Button
        TheSortingProgramButton         matlab.ui.control.Button
        tab_main_sorting                matlab.ui.container.Tab
        YourSortedArrayTextArea         matlab.ui.control.TextArea
        YourSortedArrayTextAreaLabel    matlab.ui.control.Label
        YourArrayTextArea               matlab.ui.control.TextArea
        YourArrayTextAreaLabel          matlab.ui.control.Label
        label_lamb                      matlab.ui.control.Label
        HelpButton                      matlab.ui.control.Button
        Lamp                            matlab.ui.control.Lamp
        BacktoMenuButton                matlab.ui.control.Button
        BucketButton                    matlab.ui.control.Button
        RadixButton                     matlab.ui.control.Button
        CountingButton                  matlab.ui.control.Button
        HeapButton                      matlab.ui.control.Button
        QuickButton                     matlab.ui.control.Button
        SelectionButton                 matlab.ui.control.Button
        BubbleButton                    matlab.ui.control.Button
        MergeButton                     matlab.ui.control.Button
        InsertionButton                 matlab.ui.control.Button
        EnterButton                     matlab.ui.control.Button
        HowmanynumberdoyouwantSpinner   matlab.ui.control.Spinner
        HowmanynumberdoyouwantLabel     matlab.ui.control.Label
        HighRangeSpinner                matlab.ui.control.Spinner
        HighRangeSpinnerLabel           matlab.ui.control.Label
        LowRangeSpinner                 matlab.ui.control.Spinner
        LowRangeSpinnerLabel            matlab.ui.control.Label
        SortedArrayLabel                matlab.ui.control.Label
        YourArrayLabel                  matlab.ui.control.Label
        SpeedKnob                       matlab.ui.control.DiscreteKnob
        SpeedKnobLabel                  matlab.ui.control.Label
        UIAxes                          matlab.ui.control.UIAxes
        tab_fibonacci                   matlab.ui.container.Tab
        output1Label                    matlab.ui.control.Label
        WhatvaluedoyouwantSpinnerLabel  matlab.ui.control.Label
        WhatvaluedoyouwantSpinner       matlab.ui.control.Spinner
        StartButton_2                   matlab.ui.control.Button
        BacktoMenuButton_4              matlab.ui.control.Button
        graph_fib                       matlab.ui.control.UIAxes
        tab_compare                     matlab.ui.container.Tab
        Image                           matlab.ui.control.Image
        ClearButton                     matlab.ui.control.Button
        RepeatTimeSpinner               matlab.ui.control.Spinner
        RepeatTimeLabel                 matlab.ui.control.Label
        label_output                    matlab.ui.control.Label
        label_input                     matlab.ui.control.Label
        GetarandomarrayButton           matlab.ui.control.Button
        HowmanynumberdoyouwantSpinner_2  matlab.ui.control.Spinner
        HowmanynumberdoyouwantLabel_2   matlab.ui.control.Label
        HighRangeSpinner_2              matlab.ui.control.Spinner
        HighRangeSpinner_2Label         matlab.ui.control.Label
        LowRangeSpinner_2               matlab.ui.control.Spinner
        LowRangeSpinner_2Label          matlab.ui.control.Label
        CompareButton                   matlab.ui.control.Button
        RemoveAllButton                 matlab.ui.control.Button
        SelectAllButton                 matlab.ui.control.Button
        BacktoMenuButton_2              matlab.ui.control.Button
        SortingAlgorithmsButtonGroup    matlab.ui.container.ButtonGroup
        BucketSortCheckBox              matlab.ui.control.CheckBox
        RadixSortCheckBox               matlab.ui.control.CheckBox
        CountingSortCheckBox            matlab.ui.control.CheckBox
        HeapSortCheckBox                matlab.ui.control.CheckBox
        QuickSortCheckBox               matlab.ui.control.CheckBox
        SelectionSortCheckBox           matlab.ui.control.CheckBox
        BubbleSortCheckBox              matlab.ui.control.CheckBox
        MergeSortCheckBox               matlab.ui.control.CheckBox
        InsertionSortCheckBox           matlab.ui.control.CheckBox
        UI_compare                      matlab.ui.control.UIAxes
        tab_help_sorting                matlab.ui.container.Tab
        bucket_gif                      matlab.ui.control.Image
        radix_gif                       matlab.ui.control.Image
        count_gif                       matlab.ui.control.Image
        heap_gif                        matlab.ui.control.Image
        quick_gif                       matlab.ui.control.Image
        selection_gif                   matlab.ui.control.Image
        bubble_gif                      matlab.ui.control.Image
        merge_gif                       matlab.ui.control.Image
        insertion_gif                   matlab.ui.control.Image
        TextArea                        matlab.ui.control.TextArea
        DropDown                        matlab.ui.control.DropDown
        HowCanIHelpYouLabel             matlab.ui.control.Label
        BackButton                      matlab.ui.control.Button
        Speed                           matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: EnterButton
        function EnterButtonPushed(app, event)
            range1=app.LowRangeSpinner.Value;
            range2=app.HighRangeSpinner.Value;
            num1=app.HowmanynumberdoyouwantSpinner.Value;
            %if num1>range2-range1+1
             %   B=["It is not possible to get different random numbers in that interval"]
              %  app.YourArrayLabel.Text=B
            %end
            ran1=randi([range1,range2-1],1,1);
            A(1)=[ran1];
            for i=2:num1
                ran1=randi([range1,range2-1],1,1);
                j=1;
                while i>j
                    if A(j)==ran1
                        ran1=randi([range1,range2-1],1,1);
                    if i ~= num1
                        j=1;
                    elseif i==num1
                        j=1;
                    end
                    elseif A(j)~=ran1
                        j=j+1;
                    end
                    A(i)=[ran1];
                end
            end
            A(end+1)=range2;
            app.YourArrayLabel.Text=num2str(A);
            app.YourArrayTextArea.Value=num2str(A);
            app.Lamp.Enable='on';
            app.label_lamb.Text="Ready";
            app.Lamp.Color=[1 1 0];
        end

        % Button pushed function: InsertionButton
        function InsertionButtonPushed(app, event)
            q=0;
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            import time.*
            A=str2num(app.YourArrayLabel.Text);
            speed=2;
            bar(app.UIAxes,A,'b')
            pause(0.5)
            for i=2:length(A)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    value=app.Speed.Text;
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color=[0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    cla(app.UIAxes)
                    q=q+1;
                    break
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                
                k=A(i);                                                    
                j=i-1;
                while (j>0) && (k < A(j))
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        value=app.Speed.Text;
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                            end
                        end
                        app.Lamp.Color=[0 1 0];
                        app.label_lamb.Text="Sorting";
                    end
                    if strcmp(value,'Clear') || q>0
                        cla(app.UIAxes)
                        q=q+1;
                        break
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    
                    bar(app.UIAxes,A,'b')
                    hold(app.UIAxes,'on')
                    bar(app.UIAxes,j,A(j),'g')
                    bar(app.UIAxes,j+1,A(j+1),'g')
                    hold(app.UIAxes,'off')
                    A(j + 1) =A(j);
                    A(j) = k;
                    pause(speed)
                    bar(app.UIAxes,A,'b')
                    hold(app.UIAxes,'on')
                    bar(app.UIAxes,j,A(j),'g')
                    bar(app.UIAxes,j+1,A(j+1),'g')
                    hold(app.UIAxes,'off')
                    j=j-1;
                    pause(speed)
                end
                
                
            end
            if q==0
                app.YourSortedArrayTextArea.Value=num2str(A);
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: MergeButton
        function MergeButtonPushed(app, event)
            q=0;
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            A=str2num(app.YourArrayLabel.Text);
            B=str2num(app.YourArrayLabel.Text);
            C=[];
            for i=1:length(A)
            C(i)=[0];
            end
            speed=2;
            bar(app.UIAxes,A,'b')
            
            pause(0.5)
            l =(length(A) / 2)  ;
            A1 = A(1:l);
            %İkiye bölünmesinden oluşan 1. liste
            A2 = A(l+1:length(A));
            %İkiye bölünmesinden oluşan 2. liste
            b=length(A1);
            for i=2:length(A1)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    value=app.Speed.Text;
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";

                end
                if strcmp(value,'Clear') || q>0
                    cla(app.UIAxes)
                    q=q+1;
                    break
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                %%key=değeri saklayabilmek için bir değişken
                k=A(i);
                y=B(i);
                j=i-1;
                while (j>0) && (k < A1(j))
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        value=app.Speed.Text;
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                            end
                        end
                        app.Lamp.Color= [0 1 0];
                        app.label_lamb.Text="Sorting";
                    end
                    if strcmp(value,'Clear') || q>0
                        cla(app.UIAxes)
                        q=q+1;
                        break
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    
                    A1(j + 1) =A1(j) ;
                    B(j+1)=B(j);
                    j=j-1;
                    A1(j+1) = k;
                    B(j+1)=y;
                    %Graph
                    bar(app.UIAxes,B,'b')
                    
                    pause(speed)
                    
                end
                
            end
            
            for i=2:length(A2)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";

                end
                if strcmp(value,'Clear') || q>0
                    cla(app.UIAxes)
                    q=q+1;
                    break
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                %%key=değeri saklayabilmek için bir değişken
                k=A2(i);
                y=B(i+b);
                j=i-1;
                while (j>0) && (k < A2(j))
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        value=app.Speed.Text;
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                            end
                        end
                        app.Lamp.Color= [0 1 0];
                        app.label_lamb.Text="Sorting";

                    end
                    if strcmp(value,'Clear') || q>0
                        cla(app.UIAxes)
                        q=q+1;
                        break
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    
                    A2(j + 1) =A2(j); 
                    B(b+j+1)=B(b+j);
                    j=j-1;
                    A2(j+1) = k;
                    B(b+j+1)=y;
                    %Graph
                    bar(app.UIAxes,B,'b')
                    
                    pause(speed)
                end
            end
            t = 1;
            while (t<length(A)+1)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";

                end
                if strcmp(value,'Clear') || q>0
                    cla(app.UIAxes)
                    q=q+1;
                    break
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                    
                if length(A1) == 0 && length(A2) == 0
                    break
                end
                if (length(A1) == length(A2))
                    if (A1(1) < A2(1))
                        C(t) = A1(1);
                        t = t + 1;
                        A1(1)=[];
                    elseif (A2(1) < A1(1))
                        C(t) = A2(1);
                        t = t + 1;
                        A2(1)=[];
                    elseif (A2(1) == A1(1))
                        C(t) = A1(1);
                        t = t + 1;
                        A1(1)=[];
                    end
                elseif (isempty(A1))
                    C(t) = A2(1);
                    t = t + 1;
                    A2(1)=[];
                elseif (length(A2) == 0)
                    C(t) = A1(1);
                    t = t + 1;
                    A1(1)=[];
                else
                    if (A1(1) < A2(1))
                        C(t) = A1(1);
                        t = t + 1;
                        A1(1)=[];
                    elseif (A2(1) < A1(1))
                        C(t) = A2(1);
                        t = t + 1;
                        A2(1)=[];
                    elseif (A2(1) == A1(1))
                        C(t) = A1(1);
                        t = t + 1;
                        A1(1)=[];
                    end
                end
                bar(app.UIAxes,C,'b')
                
                pause(speed)
            end
            if q==0
                app.YourSortedArrayTextArea.Value=num2str(C);
                
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: BubbleButton
        function BubbleButtonPushed(app, event)
            q=0;
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            
            A=str2num(app.YourArrayLabel.Text);
            bar(app.UIAxes,A,'b')
            
            pause(0.5)
            speed=2;
            for i=1:length(A)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    cla(app.UIAxes)
                    q=q+1;
                    break
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                
                deneme = A(1);
                %deneme=en büyük değer
                for j=2:(length(A) - i+1)
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        value=app.Speed.Text;
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                    end
                    if strcmp(value,'Clear') || q>0
                        cla(app.UIAxes)
                        q=q+1;
                        break
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    
                    if deneme > A(j)
                        bar(app.UIAxes,A,'b')
                        
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,j-1,A(j-1),'g')
                        bar(app.UIAxes,j,A(j),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                        
                        A(j - 1) = A(j);
                        A(j) = deneme;
                        
                        bar(app.UIAxes,A,'b')
                        
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,j-1,A(j-1),'g')
                        bar(app.UIAxes,j,A(j),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                        
                    elseif deneme < A(j)
                        deneme = A(j);
                    end
                    
                end
            end
            if q==0
                app.YourSortedArrayTextArea.Value=num2str(A);
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: SelectionButton
        function SelectionButtonPushed(app, event)
            q=0;
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            A=str2num(app.YourArrayLabel.Text);
            bar(app.UIAxes,A,'b')
            pause(0.5)
            speed=2;
            for i=1:length(A)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    cla(app.UIAxes)
                    q=q+1;
                    break
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                
                m = A(i);
                %m=minimum değer
                for j=i:length(A)
                    if m > A(j)
                        %speed
                        value=(app.Speed.Text);
                        if value=="Pause"
                            value=app.Speed.Text;
                            app.Lamp.Color=[1 0 0];
                            app.label_lamb.Text="Paused";
                            while true
                                pause(0.1)
                                if app.Speed.Text~="Pause"
                                    break
                                end
                            end
                            app.Lamp.Color= [0 1 0];
                            app.label_lamb.Text="Sorting";
                        end
                        if strcmp(value,'Clear') || q>0
                            cla(app.UIAxes)
                            q=q+1;
                            break
                        elseif strcmp(value,'Minimum')
                            speed=2;
                        elseif strcmp(value,'Medium')
                            speed=1;
                        elseif strcmp(value,'Maximum')
                            speed=0.1;
                        end
                        %graph
                        bar(app.UIAxes,A,'b')
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,i,A(i),'g')
                        bar(app.UIAxes,j,A(j),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                        
                        A(i) = A(j);
                        A(j) = m;
                        m = A(i);
                        
                        bar(app.UIAxes,A,'b')
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,i,A(i),'g')
                        bar(app.UIAxes,j,A(j),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                    end
                
                end
            end
            if q==0
                app.YourSortedArrayTextArea.Value=num2str(A);
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: QuickButton
        function QuickButtonPushed(app, event)
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            A=str2num(app.YourArrayLabel.Text);
            speed=2;
            q=0;
            bar(app.UIAxes,A,'b')
            pause(0.5)
            function A = quicksortforapp(A)
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    speed=0;
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                kk = 15; % Insertion sort threshold, kk >= 1
                % Quicksort
                n = length(A);
                A = quicksorti(A,1,n,kk);
            end
            function A = quicksorti(A,ll,uu,kk)
                
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    speed=0;
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                
                [A, mm] = partition(A,ll,uu);
                % Divide-and-conquer
                if ((mm - ll) <= kk)
                    % Sort x(ll:(mm - 1)) via insertion sort 
                    A = insertionsorti(A,ll,mm - 1);
                else
                    % Sort x(ll:(mm - 1)) via quick sort 
                    A = quicksorti(A,ll,mm - 1,kk);
                end
                if ((uu - mm) <= kk)
                    % Sort x((mm + 1):uu) via insertion sort 
                    A = insertionsorti(A,mm + 1,uu);
                else
                    % Sort x((mm + 1):uu) via quick sort 
                    A = quicksorti(A,mm + 1,uu,kk);
                end
            end
            function [A, mm] = partition(A,ll,uu)
                
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    speed=0;
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                
                pp = medianofthree(A,ll,uu); % Median-of-three pivot index
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    speed=0;
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                %graph
                if q==0
                    bar(app.UIAxes,A,'b')
                    hold(app.UIAxes,'on')
                    bar(app.UIAxes,ll,A(ll),'g')
                    bar(app.UIAxes,pp,A(pp),'g')
                    hold(app.UIAxes,'off')
                    pause(speed)
                end
                
                
                val = A(ll);
                A(ll) = A(pp);
                A(pp) = val;
                if q==0
                    bar(app.UIAxes,A,'b')
                    hold(app.UIAxes,'on')
                    bar(app.UIAxes,ll,A(ll),'g')
                    bar(app.UIAxes,pp,A(pp),'g')
                    hold(app.UIAxes,'off')
                    pause(speed)
                  
                end
                
                
                mm = ll;
                for j = (ll + 1):uu
                    if (A(j) < A(ll))
                        mm = mm + 1;
                        %speed
                        value=(app.Speed.Text);
                        if value=="Pause"
                            value=app.Speed.Text;
                            app.Lamp.Color=[1 0 0];
                            app.label_lamb.Text="Paused";
                            while true
                                pause(0.1)
                                if app.Speed.Text~="Pause"
                                    break
                                end
                            end
                            app.Lamp.Color= [0 1 0];
                            app.label_lamb.Text="Sorting";
                        end
                        if strcmp(value,'Clear') || q>0
                            q=q+1;
                            cla(app.UIAxes)
                            speed=0;
                        elseif strcmp(value,'Minimum')
                            speed=2;
                        elseif strcmp(value,'Medium')
                            speed=1;
                        elseif strcmp(value,'Maximum')
                            speed=0.1;
                        end
                        %graph
                        if q==0
                            bar(app.UIAxes,A,'b')
                            hold(app.UIAxes,'on')
                            bar(app.UIAxes,mm,A(mm),'g')
                            bar(app.UIAxes,j,A(j),'g')
                            hold(app.UIAxes,'off')
                            pause(speed)
                        end
                        
                        
                        val = A(mm);
                        A(mm) = A(j);
                        A(j) = val;
                        if q==0
                            bar(app.UIAxes,A,'b')
                            hold(app.UIAxes,'on')
                            bar(app.UIAxes,mm,A(mm),'g')
                            bar(app.UIAxes,j,A(j),'g')
                            hold(app.UIAxes,'off')
                            pause(speed)
                        end
                        
                    end
                end
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    speed=0;
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                %graph
                if q==0
                    bar(app.UIAxes,A,'b')
                    hold(app.UIAxes,'on')
                    bar(app.UIAxes,ll,A(ll),'g')
                    bar(app.UIAxes,mm,A(mm),'g')
                    hold(app.UIAxes,'off')
                    pause(speed)
                end
                
                
                val = A(ll);
                A(ll) = A(mm);
                A(mm) = val;
                if q==0
                    bar(app.UIAxes,A,'b')
                    hold(app.UIAxes,'on')
                    bar(app.UIAxes,ll,A(ll),'g')
                    bar(app.UIAxes,mm,A(mm),'g')
                    hold(app.UIAxes,'off')
                    pause(speed)
                end
                
                
            end
            function pp = medianofthree(x,ll,uu)
                mm = ll + floor((uu - ll) / 2);
                if (x(ll) <= x(mm))
                    if (x(uu) >= x(mm))
                        pp = mm;
                    elseif (x(uu) >= x(ll))
                        pp = uu;
                    else
                        pp = ll;
                    end
                else
                    if (x(uu) >= x(ll))
                        pp = ll;
                    elseif (x(uu) >= x(mm))
                        pp = uu;
                    else
                        pp = mm;
                    end
                end
            end
            function A = insertionsorti(A,ll,uu)
                for j = (ll + 1):uu
                    pivot = A(j);
                    i = j;
                    while ((i > ll) && (A(i - 1) > pivot))
                        %speed
                        value=(app.Speed.Text);
                        if value=="Pause"
                            value=app.Speed.Text;
                            app.Lamp.Color=[1 0 0];
                            app.label_lamb.Text="Paused";
                            while true
                                pause(0.1)
                                if app.Speed.Text~="Pause"
                                    break
                                end
                            end
                            app.Lamp.Color= [0 1 0];
                            app.label_lamb.Text="Sorting";
                        end
                        if strcmp(value,'Clear') || q>0
                            q=q+1;
                            cla(app.UIAxes)
                            speed=0;
                        elseif strcmp(value,'Minimum')
                            speed=2;
                        elseif strcmp(value,'Medium')
                            speed=1;
                        elseif strcmp(value,'Maximum')
                            speed=0.1;
                        end
                        %graph
                        if q==0
                            bar(app.UIAxes,A,'b')
                            hold(app.UIAxes,'on')
                            bar(app.UIAxes,i,A(i),'g')
                            bar(app.UIAxes,i-1,A(i-1),'g')
                            hold(app.UIAxes,'off')
                            pause(speed)
                        
                        end
                        
                        A(i) = A(i - 1);
                        
                        i = i - 1;
                    end
                    A(i) = pivot;
                    if q==0
                        bar(app.UIAxes,A,'b')
                        pause(speed)
                    end
                    
                    
                end
            end
            A=quicksortforapp(A);
            app.label_lamb.Text="Finished";
            pause(0.5)
            if q==0
                app.YourSortedArrayTextArea.Value=num2str(A);
            end
            
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: HeapButton
        function HeapButtonPushed(app, event)
            q=0;
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            A=str2num(app.YourArrayLabel.Text);
            bar(app.UIAxes,A,'b')
            pause(0.5)
            speed=2;
            function A = heapsortforapp(A)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    speed=0;
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                
                n = length(A);
                A = buildmaxheap(A,n);
                heapsize = n;
                for i = n:-1:2
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        value=app.Speed.Text;
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                            end
                        end
                        app.Lamp.Color= [0 1 0];
                        app.label_lamb.Text="Sorting";
                    end
                    if strcmp(value,'Clear') || q>0
                        q=q+1;
                        cla(app.UIAxes)
                        speed=0;
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    %graph
                    if q==0
                        bar(app.UIAxes,A,'b')
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,1,A(1),'g')
                        bar(app.UIAxes,i,A(i),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                    end
                        
                    
                    val = A(1);
                    A(1) = A(i);
                    A(i) = val;
                    if q==0
                        bar(app.UIAxes,A,'b')
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,1,A(1),'g')
                        bar(app.UIAxes,i,A(i),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                    end
                        
                    
                    heapsize = heapsize - 1;
                    A = maxheapify(A,1,heapsize);
                end
            end
            function A = buildmaxheap(A,n)
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    speed=0;
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                
                for i = floor(n / 2):-1:1
                    A = maxheapify(A,i,n);
                end
            end
            function A = maxheapify(A,i,heapsize)
                l = 2 * i;
                r = l + 1;
                if ((l <= heapsize) && (A(l) > A(i)))
                    largest = l;
                else
                    largest = i;
                end
                if ((r <= heapsize) && (A(r) > A(largest)))
                    largest = r;
                end
                if (largest ~= i)
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        value=app.Speed.Text;
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                            end
                        end
                        app.Lamp.Color= [0 1 0];
                        app.label_lamb.Text="Sorting";
                    end
                    if strcmp(value,'Clear') || q>0
                        q=q+1;
                        cla(app.UIAxes)
                        speed=0;
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    %graph
                    if q==0
                        bar(app.UIAxes,A,'b')
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,i,A(i),'g')
                        bar(app.UIAxes,largest,A(largest),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                    end
                    
                    
                    val = A(i);
                    A(i) = A(largest);
                    A(largest) = val;
                    if q==0
                        bar(app.UIAxes,A,'b')
                        hold(app.UIAxes,'on')
                        bar(app.UIAxes,i,A(i),'g')
                        bar(app.UIAxes,largest,A(largest),'g')
                        hold(app.UIAxes,'off')
                        pause(speed)
                    end
                        
                    
                    A = maxheapify(A,largest,heapsize);
                end
            end
            A=heapsortforapp(A);
            if q==0
                
                app.YourSortedArrayTextArea.Value=num2str(A);
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Value changed function: SpeedKnob
        function SpeedKnobValueChanged(app, event)
            value = app.SpeedKnob.Value;
            app.Speed.Text=value;
        end

        % Button pushed function: CountingButton
        function CountingButtonPushed(app, event)
            q=0;
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            speed=2;
            range2=app.HighRangeSpinner.Value;
            A=str2num(app.YourArrayLabel.Text);
            B=[];
            bar(app.UIAxes,A,'b')
            pause(1)
            for i=1:length(A)
                B(i)=[0];
            end
            C = [];
            for i=1:range2
                C(i)=0;
            end
            for j=1:length(A)
%                 %speed
%                 value=(app.Speed.Text);
%                 if value=="Pause"
%                     value=app.Speed.Text;
%                     app.Lamp.Color=[1 0 0];
%                     app.label_lamb.Text="Paused";
%                     while true
%                         pause(0.1)
%                         if app.Speed.Text~="Pause"
%                             break
%                         end
%                     end
%                     app.Lamp.Color= [0 1 0];
%                     app.label_lamb.Text="Sorting";
%                 end
%                 if strcmp(value,'Off')
%                     speed=0;
%                 elseif strcmp(value,'Minimum')
%                     speed=2;
%                 elseif strcmp(value,'Medium')
%                     speed=1;
%                 elseif strcmp(value,'Maximum')
%                     speed=0.1;
%                 end
                
                C(A(j)) = C(A(j)) + 1;
                %graph
%                 bar(app.UIAxes,C,'b')
%                 pause(speed)
            end
            for i=2:range2
%                 %speed
%                 value=(app.Speed.Text);
%                 if value=="Pause"
%                     value=app.Speed.Text;
%                     app.Lamp.Color=[1 0 0];
%                     app.label_lamb.Text="Paused";
%                     while true
%                         pause(0.1)
%                         if app.Speed.Text~="Pause"
%                             break
%                         end
%                     end
%                     app.Lamp.Color= [0 1 0];
%                     app.label_lamb.Text="Sorting";
%                 end
%                 if strcmp(value,'Off')
%                     speed=0;
%                 elseif strcmp(value,'Minimum')
%                     speed=2;
%                 elseif strcmp(value,'Medium')
%                     speed=1;
%                 elseif strcmp(value,'Maximum')
%                     speed=0.1;
%                 end
                
                C(i) = C(i) + C(i-1);
                %graph
%                 bar(app.UIAxes,C,'b')
%                 pause(speed)
            end
            for j=length(A): -1 : 1
                %speed
                value=(app.Speed.Text);
                if value=="Pause"
                    value=app.Speed.Text;
                    app.Lamp.Color=[1 0 0];
                    app.label_lamb.Text="Paused";
                    while true
                        pause(0.1)
                        if app.Speed.Text~="Pause"
                            break
                        end
                    end
                    app.Lamp.Color= [0 1 0];
                    app.label_lamb.Text="Sorting";
                end
                if strcmp(value,'Clear') || q>0
                    q=q+1;
                    cla(app.UIAxes)
                    break
                elseif strcmp(value,'Minimum')
                    speed=2;
                elseif strcmp(value,'Medium')
                    speed=1;
                elseif strcmp(value,'Maximum')
                    speed=0.1;
                end
                B(C(A(j))) = A(j);
                C(A(j)) = C(A(j)) - 1;
                bar(app.UIAxes,B,'b')
                pause(speed)
            end
            if q==0
                app.YourSortedArrayTextArea.Value=num2str(B);
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: RadixButton
        function RadixButtonPushed(app, event)
            q=0;
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            speed=2;
            range2=app.HighRangeSpinner.Value;
            A=str2num(app.YourArrayLabel.Text);
            C=[];
            b = 1;
            bar(app.UIAxes,A,'b')
            pause(1)
            for i=1:length(A)
                    B(i)=[0];
            end
            while true
                if range2/b<1 && range2/b~=0
                    break
                end
                C=[];
                for i=1:10
                   C(i)=[0];
                end
                for j=1:length(A)
%                     %speed
%                     value=(app.Speed.Text);
%                     if value=="Pause"
%                         value=app.Speed.Text;
%                         app.Lamp.Color=[1 0 0];
%                         app.label_lamb.Text="Paused";
%                         while true
%                             pause(0.1)
%                             if app.Speed.Text~="Pause"
%                                 break
%                             end
%                         end
%                         app.Lamp.Color= [0 1 0];
%                         app.label_lamb.Text="Sorting";
%                     end
%                     if strcmp(value,'Off')
%                         speed=0;
%                     elseif strcmp(value,'Minimum')
%                         speed=2;
%                     elseif strcmp(value,'Medium')
%                         speed=1;
%                     elseif strcmp(value,'Maximum')
%                         speed=0.1;
%                     end
                    
                    if mod((A(j)/b),10)==0
                       C(1)=C(1)+1;
                    elseif floor(mod((A(j)/b),10))==0
                        C(1)=C(1)+1;
                    else
                        C(1+floor(mod((A(j)/b),10)))=C(1+floor(mod((A(j)/b),10)))+1;
                    end
%                     %Graph
%                     bar(app.UIAxes,C,'b')
%                     pause(speed)
                end
                for i=2:10
%                     %speed
%                     value=(app.Speed.Text);
%                     if value=="Pause"
%                         value=app.Speed.Text;
%                         app.Lamp.Color=[1 0 0];
%                         app.label_lamb.Text="Paused";
%                         while true
%                             pause(0.1)
%                             if app.Speed.Text~="Pause"
%                                 break
%                             end
%                         end
%                         app.Lamp.Color= [0 1 0];
%                         app.label_lamb.Text="Sorting";
%                     end
%                     if strcmp(value,'Off')
%                         speed=0;
%                     elseif strcmp(value,'Minimum')
%                         speed=2;
%                     elseif strcmp(value,'Medium')
%                         speed=1;
%                     elseif strcmp(value,'Maximum')
%                         speed=0.1;
%                     end
%                     
                    C(i)=C(i)+C(i-1);
%                     %Graph
%                     bar(app.UIAxes,C,'b')
%                     pause(speed)
                end
                for j=length(A):-1:1
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        value=app.Speed.Text;
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                            end
                        end
                        app.Lamp.Color= [0 1 0];
                        app.label_lamb.Text="Sorting";
                    end
                    if strcmp(value,'Clear') || q>0
                        q=q+1;
                        cla(app.UIAxes)
                        break
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    
                    if mod((A(j)/b),10)==0
                       B(C(1))=A(j);
                       C(1)=C(1)-1;
                   elseif floor(mod((A(j)/b),10))==0
                        B(C(1))=A(j);
                       C(1)=C(1)-1;
                    else
                        B(C(1+floor(mod((A(j)/b),10))))=A(j);
                        C(1+floor(mod((A(j)/b),10)))=C(1+floor(mod((A(j)/b),10)))-1;
                    end
                    %Graph
                    bar(app.UIAxes,B,'b')
                    pause(speed)
                end
                A=B;
                B=[];
                for i=1:length(A)
                    B(i)=[0];
                end
                b=b*10;
            end
            if q==0

                app.YourSortedArrayTextArea.Value=num2str(A);
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: BucketButton
        function BucketButtonPushed(app, event)
            import time.*
            app.Lamp.Color= [0 1 0];
            app.label_lamb.Text="Sorting";
            q=0;
            speed=2;
            A=str2num(app.YourArrayLabel.Text);
            bar(app.UIAxes,A,'b')
            
            max_array=max(A);
            bucket= zeros(1,max_array+1);
            for j=1:numel(A)
                bucket(A(j))=bucket(A(j))+1;
            end
            index=1;
            for i = 1:max_array+1
                for j =1:bucket(i)
                    %speed
                    value=(app.Speed.Text);
                    if value=="Pause"
                        value=app.Speed.Text;
                        app.Lamp.Color=[1 0 0];
                        app.label_lamb.Text="Paused";
                        while true
                            pause(0.1)
                            if app.Speed.Text~="Pause"
                                break
                            end
                        end
                        app.Lamp.Color= [0 1 0];
                        app.label_lamb.Text="Sorting";
                    end
                    if strcmp(value,'Clear') || q>0
                        q=q+1;
                        cla(app.UIAxes)
                        break
                    elseif strcmp(value,'Minimum')
                        speed=2;
                    elseif strcmp(value,'Medium')
                        speed=1;
                    elseif strcmp(value,'Maximum')
                        speed=0.1;
                    end
                    
                    A(index) =i;
                    index=index+1;
                    [A]=A;
                    
                    %Graph
                    bar(app.UIAxes,A,'b')
                    pause(speed)
                    
                    drawnow limitrate
                    
                end
            end
            if q==0
                app.YourSortedArrayTextArea.Value=num2str(A);
            end
            app.label_lamb.Text="Finished";
            pause(0.5)
            app.Lamp.Color=[1 1 0];
            app.label_lamb.Text="Ready";
        end

        % Button pushed function: TheSortingProgramButton
        function TheSortingProgramButtonPushed(app, event)
            app.TabGroup.SelectedTab=app.tab_main_sorting;
        end

        % Button pushed function: BacktoMenuButton
        function BacktoMenuButtonPushed(app, event)
            app.TabGroup.SelectedTab=app.tab_Menu;
        end

        % Button pushed function: HelpButton
        function HelpButtonPushed(app, event)
            app.TabGroup.SelectedTab=app.tab_help_sorting;
        end

        % Button pushed function: BackButton
        function BackButtonPushed(app, event)
            app.TabGroup.SelectedTab=app.tab_main_sorting;
        end

        % Button pushed function: BacktoMenuButton_2
        function BacktoMenuButton_2Pushed(app, event)
            app.TabGroup.SelectedTab=app.tab_Menu;
        end

        % Button pushed function: BacktoMenuButton_4
        function BacktoMenuButton_4Pushed(app, event)
            cla(app.graph_fib);
            app.output1Label.Visible= 'off';
            app.WhatvaluedoyouwantSpinner.Value=1;
            app.TabGroup.SelectedTab=app.tab_Menu;
        end

        % Button pushed function: FibonacciFinderProgramButton
        function FibonacciFinderProgramButtonPushed(app, event)
            app.TabGroup.SelectedTab=app.tab_fibonacci;
        end

        % Button pushed function: SpeedCompareProgramButton
        function SpeedCompareProgramButtonPushed(app, event)
            app.TabGroup.SelectedTab=app.tab_compare;
        end

        % Button pushed function: StartButton_2
        function StartButton_2Pushed(app, event)
            secim1=app.WhatvaluedoyouwantSpinner.Value;
            sonuc=["0"];
            sonuc2=[0];
            
            if secim1~=1
                sonuc=["0","1"];
                sonuc2=[0,1];
            end
            j=1;
            k=1;
            for i=3:secim1
                j=num2str(j);
                sonuc(i)=[j];
                j=str2num(j);
                sonuc2(i)=[j];
                l=j;
                j = k + j;
                k=l;
            end

            app.output1Label.Text=(sonuc);
            app.output1Label.Visible= 'on';
            plot(app.graph_fib,sonuc2,'or')
            
            
        end

        % Button pushed function: SelectAllButton
        function SelectAllButtonPushed(app, event)
            app.InsertionSortCheckBox.Value = 1;
            app.MergeSortCheckBox.Value= 1;
            app.BubbleSortCheckBox.Value= 1;
            app.SelectionSortCheckBox.Value= 1;
            app.QuickSortCheckBox.Value=1;
            app.HeapSortCheckBox.Value=1;
            app.CountingSortCheckBox.Value=1;
            app.RadixSortCheckBox.Value=1;
            app.BucketSortCheckBox.Value=1;
        end

        % Button pushed function: RemoveAllButton
        function RemoveAllButtonPushed(app, event)
            app.InsertionSortCheckBox.Value = 0;
            app.MergeSortCheckBox.Value= 0;
            app.BubbleSortCheckBox.Value= 0;
            app.SelectionSortCheckBox.Value= 0;
            app.QuickSortCheckBox.Value=0;
            app.HeapSortCheckBox.Value=0;
            app.CountingSortCheckBox.Value=0;
            app.RadixSortCheckBox.Value=0;
            app.BucketSortCheckBox.Value=0;
        end

        % Button pushed function: CompareButton
        function CompareButtonPushed(app, event)
            import time.*
            exit=app.RepeatTimeSpinner.Value;
            q=1;
            %functions
            
            %quicksort
            function A = quicksortforapp(A)
                kk = 15; % Insertion sort threshold, kk >= 1
                % Quicksort
                n = length(A);
                A = quicksorti(A,1,n,kk);
            end
            
            function A = quicksorti(A,ll,uu,kk)
                
                
                [A, mm] = partition(A,ll,uu);
                % Divide-and-conquer
                if ((mm - ll) <= kk)
                    % Sort x(ll:(mm - 1)) via insertion sort 
                    A = insertionsorti(A,ll,mm - 1);
                else
                    % Sort x(ll:(mm - 1)) via quick sort 
                    A = quicksorti(A,ll,mm - 1,kk);
                end
                if ((uu - mm) <= kk)
                    % Sort x((mm + 1):uu) via insertion sort 
                    A = insertionsorti(A,mm + 1,uu);
                else
                    % Sort x((mm + 1):uu) via quick sort 
                    A = quicksorti(A,mm + 1,uu,kk);
                end
            end
            
            function [A, mm] = partition(A,ll,uu)
                
                
                pp = medianofthree(A,ll,uu); % Median-of-three pivot index
                
                val = A(ll);
                A(ll) = A(pp);
                A(pp) = val;
                
                
                mm = ll;
                for j = (ll + 1):uu
                    if (A(j) < A(ll))
                        mm = mm + 1;
                       
                       
                        
                        val = A(mm);
                        A(mm) = A(j);
                        A(j) = val;
                        
                        
                    end
                end
                
                val = A(ll);
                A(ll) = A(mm);
                A(mm) = val;
                
              
                
            end
            function pp = medianofthree(x,ll,uu)
                mm = ll + floor((uu - ll) / 2);
                if (x(ll) <= x(mm))
                    if (x(uu) >= x(mm))
                        pp = mm;
                    elseif (x(uu) >= x(ll))
                        pp = uu;
                    else
                        pp = ll;
                    end
                else
                    if (x(uu) >= x(ll))
                        pp = ll;
                    elseif (x(uu) >= x(mm))
                        pp = uu;
                    else
                        pp = mm;
                    end
                end
            end
            function A = insertionsorti(A,ll,uu)
                for j = (ll + 1):uu
                    pivot = A(j);
                    i = j;
                    while ((i > ll) && (A(i - 1) > pivot))                                
                        A(i) = A(i - 1);
                        
                        i = i - 1;
                    end
                    A(i) = pivot;
                    
                end
            end
            
            %heap sort
            function A = heapsort(A)
                n = length(A);
                A = buildmaxheap(A,n);
                heapsize = n;
                for i = n:-1:2
                    val = A(1);
                    A(1) = A(i);
                    A(i) = val;
                    heapsize = heapsize - 1;
                    A = maxheapify(A,1,heapsize);
                end
            end
            function A = buildmaxheap(A,n)
                for i = floor(n / 2):-1:1
                    A = maxheapify(A,i,n);
                end
            end
            function A = maxheapify(A,i,heapsize)
                l = 2 * i;
                r = l + 1;
                if ((l <= heapsize) && (A(l) > A(i)))
                    largest = l;
                else
                    largest = i;
                end
                if ((r <= heapsize) && (A(r) > A(largest)))
                    largest = r;
                end
                if (largest ~= i)
                    val = A(i);
                    A(i) = A(largest);
                    A(largest) = val;
                    A = maxheapify(A,largest,heapsize);
                end
            end
                    
            mul=0;
            while exit~=0
                
                if exit==0
                    break
                end
                if mul==0
                    A=str2num(app.label_input.Text);
                    range2=app.HighRangeSpinner_2.Value;
                else
                    range1=app.LowRangeSpinner_2.Value;
                    range2=app.HighRangeSpinner_2.Value;
                    range2=range2+mul;
                    num1=app.HowmanynumberdoyouwantSpinner_2.Value;
                    num1=num1+mul;
                    
                    ran1=randi([range1,range2-1],1,1);
                    A(1)=[ran1];
                    for i=2:num1
                        ran1=randi([range1,range2-1],1,1);
                        j=1;
                        while i>j
                            if A(j)==ran1
                                ran1=randi([range1,range2-1],1,1);
                            if i ~= num1
                                j=1;
                            elseif i==num1
                                j=1;
                            end
                            elseif A(j)~=ran1
                                j=j+1;
                            end
                            A(i)=[ran1];
                        end
                    end
                    A(end+1)=range2;
                    app.label_input.Text=num2str(A);
                end
                hold(app.UI_compare,'on');
                A=str2num(app.label_input.Text);
                if app.InsertionSortCheckBox.Value == 1
                    %insertion sort
                    tic;
                    for i=2:length(A)
                    k=A(i);                                                    
                    j=i-1;
                        while (j>0) && (k < A(j))
    
                            A(j + 1) =A(j);
                            A(j) = k;
    
                            j=j-1;
                        end
                    end
                    toc;
                   
                    scatter(app.UI_compare,q,toc,'blue','filled')
                    
                    
                    
                end
                A=str2num(app.label_input.Text);
                if app.MergeSortCheckBox.Value==1
                    %merge sort
                    B=A;
                    tic;
                    C=[];
                    for i=1:length(A)
                    C(i)=[0];
                    end
                    l =(length(A) / 2)  ;
                    A1 = A(1:l);
                    %İkiye bölünmesinden oluşan 1. liste
                    A2 = A(l+1:length(A));
                    %İkiye bölünmesinden oluşan 2. liste
                    b=length(A1);
                    for i=2:length(A1)
                        %%key=değeri saklayabilmek için bir değişken
                        k=A(i);
                        y=B(i);
                        j=i-1;
                        while (j>0) && (k < A1(j))
                            
                            A1(j + 1) =A1(j) ;
                            B(j+1)=B(j);
                            j=j-1;
                            A1(j+1) = k;
                            B(j+1)=y;
                            
                            
                        end
                        
                    end
                    
                    for i=2:length(A2)
                        %%key=değeri saklayabilmek için bir değişken
                        k=A2(i);
                        y=B(i+b);
                        j=i-1;
                        while (j>0) && (k < A2(j))
                            
                            A2(j + 1) =A2(j); 
                            B(b+j+1)=B(b+j);
                            j=j-1;
                            A2(j+1) = k;
                            B(b+j+1)=y;
                        end
                    end
                    t = 1;
                    while (t<length(A)+1)
                            
                        if isempty(A1) && isempty(A2)
                            break
                        end
                        if (length(A1) == length(A2))
                            if (A1(1) < A2(1))
                                C(t) = A1(1);
                                t = t + 1;
                                A1(1)=[];
                            elseif (A2(1) < A1(1))
                                C(t) = A2(1);
                                t = t + 1;
                                A2(1)=[];
                            elseif (A2(1) == A1(1))
                                C(t) = A1(1);
                                t = t + 1;
                                A1(1)=[];
                            end
                        elseif (isempty(A1))
                            C(t) = A2(1);
                            t = t + 1;
                            A2(1)=[];
                        elseif (isempty(A2))
                            C(t) = A1(1);
                            t = t + 1;
                            A1(1)=[];
                        else
                            if (A1(1) < A2(1))
                                C(t) = A1(1);
                                t = t + 1;
                                A1(1)=[];
                            elseif (A2(1) < A1(1))
                                C(t) = A2(1);
                                t = t + 1;
                                A2(1)=[];
                            elseif (A2(1) == A1(1))
                                C(t) = A1(1);
                                t = t + 1;
                                A1(1)=[];
                            end
                        end
                    end
                    toc;

                    scatter(app.UI_compare,q,toc,'red','filled')
                    
                    
                end
                A=str2num(app.label_input.Text);
                if app.BubbleSortCheckBox.Value==1
                    %bubble sort
                    tic;
                    for i=1:length(A)
                        
                        deneme = A(1);
                        %deneme=en büyük değer
                        for j=2:(length(A) - i+1)
                            
                            if deneme > A(j)
                                
                                
                                A(j - 1) = A(j);
                                A(j) = deneme;
                                
                            elseif deneme < A(j)
                                deneme = A(j);
                            end
                            
                        end
                    end
                    
                    toc;
                    if q==0
                        scatter(app.UI_compare,q,toc,'cyan',"filled",'DisplayName','BUBBLE SORT')
                    else
                        scatter(app.UI_compare,q,toc,'cyan',"filled")
                    end
                end
                A=str2num(app.label_input.Text);
                if app.SelectionSortCheckBox.Value==1
                    %Selection Sort
                    tic;
                    for i=1:length(A)
                        m = A(i);
                        for j=i:length(A)
                            if m > A(j)
                                A(i) = A(j);
                                A(j) = m;
                                m = A(i);
                            end
                        end
                    end
                    toc;
                    if q==0
                        scatter(app.UI_compare,q,toc,'magenta',"filled",'DisplayName','SELECTION SORT')
                    else
                        scatter(app.UI_compare,q,toc,'magenta',"filled")

                    end
                end
                A=str2num(app.label_input.Text);
                if app.QuickSortCheckBox.Value==1
                    %quick sort
                    
                    tic;
                    quicksortforapp(A);
                    
                    toc;
                    
                    scatter(app.UI_compare,q,toc,'MarkerEdgeColor',[0.6350 0.0780 0.1840],'MarkerFaceColor',[0.6350 0.0780 0.1840])
                    
                    
                end
                A=str2num(app.label_input.Text);
                if app.HeapSortCheckBox.Value==1
                    %heap sort
                    tic;
                    
                    A=heapsort(A);
                    
                    toc;
                    
                    scatter(app.UI_compare,q,toc,'yellow',"filled")
                    
                    
                end
                A=str2num(app.label_input.Text);
                if app.CountingSortCheckBox.Value==1
                    %counting sort
                    B=[];
                    tic;
                    for i=1:length(A)
                        B(i)=[0];
                    end
                    C = [];
                    for i=1:range2
                        C(i)=0;
                    end
                    for j=1:length(A)
        
                        
                        C(A(j)) = C(A(j)) + 1;
        
                    end
                    for i=2:range2
        
                        
                        C(i) = C(i) + C(i-1);
        
                    end
                    for j=length(A): -1 : 1
                        
                        B(C(A(j))) = A(j);
                        C(A(j)) = C(A(j)) - 1;
                        
                    end
                    toc;
                    scatter(app.UI_compare,q,toc,'MarkerEdgeColor',[0.8500 0.3250 0.0980],'MarkerFaceColor',[0.8500 0.3250 0.0980])
                end
                A=str2num(app.label_input.Text);
                if app.RadixSortCheckBox.Value==1
                    %radix sort
                    tic;
                    for i=1:length(A)
                        B(i)=[0];
                    end
                    b=1;
                    while true
                        if range2/b<1 && range2/b~=0
                            break
                        end
                        C=[];
                        for i=1:10
                           C(i)=[0];
                        end
                        for j=1:length(A)                
                            if mod((A(j)/b),10)==0
                               C(1)=C(1)+1;
                            elseif floor(mod((A(j)/b),10))==0
                                C(1)=C(1)+1;
                            else
                                C(1+floor(mod((A(j)/b),10)))=C(1+floor(mod((A(j)/b),10)))+1;
                            end
                        end
                        for i=2:10

                            C(i)=C(i)+C(i-1);

                        end
                        for j=length(A):-1:1
                            
                            
                            if mod((A(j)/b),10)==0
                               B(C(1))=A(j);
                               C(1)=C(1)-1;
                           elseif floor(mod((A(j)/b),10))==0
                                B(C(1))=A(j);
                               C(1)=C(1)-1;
                            else
                                B(C(1+floor(mod((A(j)/b),10))))=A(j);
                                C(1+floor(mod((A(j)/b),10)))=C(1+floor(mod((A(j)/b),10)))-1;
                            end
                            
                        end
                        A=B;
                        B=[];
                        for i=1:length(A)
                            B(i)=[0];
                        end
                        b=b*10;
                    end
                    
                    toc;
                    scatter(app.UI_compare,q,toc,'MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880])
                end
                A=str2num(app.label_input.Text);
                if app.BucketSortCheckBox.Value
                    %bucket sort
                    tic;
                    max_array=max(A);
                    bucket= zeros(1,max_array+1);
                    for j=1:numel(A)
                        bucket(A(j))=bucket(A(j))+1;
                    end
                    index=1;
                    for i = 1:max_array+1
                        for j =1:bucket(i)
                            
                            A(index) =i;
                            index=index+1;
                            [A]=A;
                            
                        end
                    end
                    
                    toc;
                    scatter(app.UI_compare,q,toc,'black',"filled")
                end
                q=q+1;
                exit=exit-1;
                mul=mul+200;
                %legend(app.UI_compare,{'INSERTION SORT','MERGE SORT','BUBBLE SORT'})
            end

          

        end

        % Button pushed function: GetarandomarrayButton
        function GetarandomarrayButtonPushed(app, event)
            range1=app.LowRangeSpinner_2.Value;
            range2=app.HighRangeSpinner_2.Value;
            num1=app.HowmanynumberdoyouwantSpinner_2.Value;
            %if num1>range2-range1+1
             %   B=["It is not possible to get different random numbers in that interval"]
              %  app.YourArrayLabel.Text=B
            %end
            ran1=randi([range1,range2-1],1,1);
            A(1)=[ran1];
            for i=2:num1
                ran1=randi([range1,range2-1],1,1);
                j=1;
                while i>j
                    if A(j)==ran1
                        ran1=randi([range1,range2-1],1,1);
                    if i ~= num1
                        j=1;
                    elseif i==num1
                        j=1;
                    end
                    elseif A(j)~=ran1
                        j=j+1;
                    end
                    A(i)=[ran1];
                end
            end
            A(end+1)=range2;
            app.label_input.Text=num2str(A);
        end

        % Button pushed function: ClearButton
        function ClearButtonPushed(app, event)
            cla(app.UI_compare);
        end

        % Value changed function: DropDown
        function DropDownValueChanged(app, event)
            value = app.DropDown.Value;
            app.insertion_gif.Visible='off';
            app.merge_gif.Visible='off';
            app.bubble_gif.Visible='off';
            app.selection_gif.Visible='off';
            app.quick_gif.Visible='off';
            app.heap_gif.Visible='off';
            app.count_gif.Visible='off';
            app.radix_gif.Visible='off';
            app.bucket_gif.Visible='off';
            if value=="What is insertion sort?"
                app.insertion_gif.Visible='on';
                app.TextArea.Value="Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time.It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort";
            elseif value=="What is merge sort?"
                app.merge_gif.Visible='on';
                app.TextArea.Value="Merge sort is a divide and conquer algorithm that was invented by John von Neumann in 1945.";
            elseif value=="What is bubble sort?"
                app.bubble_gif.Visible='on';
               app.TextArea.Value="Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order. The pass through the list is repeated until the list is sorted. "; 
            elseif value=="What is selection sort?"
                app.selection_gif.Visible='on';
                app.TextArea.Value="Selection sort is a sorting algorithm and it  performs worse than the similar insertion sort. Selection sort is noted for its simplicity, and generally  it has performance advantages over more complicated algorithms in certain situations, particularly where auxiliary memory is limited.";
            elseif value=="What is quick sort?"
                app.quick_gif.Visible='on';
                app.TextArea.Value="Quicksort (sometimes called partition-exchange sort) is an efficient sorting algorithm, serving as a systematic method for placing the elements of a random access file or an array in order. Developed by British computer scientist Tony Hoare in 1959 and published in 1961";
            elseif value=="What is heap sort?"
                app.heap_gif.Visible='on';
                app.TextArea.Value="Heapsort is a comparison-based sorting algorithm. Heapsort can be thought of as an improved selection sort: like that algorithm, it divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the largest element and moving that to the sorted region. The improvement consists of the use of a heap data structure rather than a linear-time search to find the maximum.Heapsort was invented by J. W. J. Williams in 1964.";
            elseif value =="What is counting sort?"
                app.count_gif.Visible='on';
                app.TextArea.Value="Counting sort is an algorithm for sorting a collection of objects according to keys that are small integers; that is, it is an integer sorting algorithm.";
            elseif value=="What is radix sort?"
                app.radix_gif.Visible='on';
                app.TextArea.Value="Radix sort is a non-comparative sorting algorithm. It avoids comparison by creating and distributing elements into buckets according to their radix. For elements with more than one significant digit, this bucketing process is repeated for each digit, while preserving the ordering of the prior step, until all digits have been considered. For this reason, radix sort has also been called bucket sort and digital sort.";
            elseif value=="What is bucket sort?"
                app.bucket_gif.Visible='on';
                app.TextArea.Value="Bucket sort, or bin sort, is a sorting algorithm that works by distributing the elements of an array into a number of buckets. Each bucket is then sorted individually, either using a different sorting algorithm, or by recursively applying the bucket sorting algorithm. It is a distribution sort, a generalization of pigeonhole sort, and is a cousin of radix sort in the most-to-least significant digit flavor. Bucket sort can be implemented with comparisons and therefore can also be considered a comparison sort algorithm.";
                
                
            end
        end

        % Size changed function: tab_fibonacci
        function tab_fibonacciSizeChanged(app, event)
            position = app.tab_fibonacci.Position;
            
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            web('https://ikcu.edu.tr/')
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create AlgorithmProjectUIFigure and hide until all components are created
            app.AlgorithmProjectUIFigure = uifigure('Visible', 'off');
            app.AlgorithmProjectUIFigure.Color = [0.8471 0.8471 0.8471];
            app.AlgorithmProjectUIFigure.Position = [100 100 907 651];
            app.AlgorithmProjectUIFigure.Name = 'Algorithm Project';

            % Create Speed
            app.Speed = uilabel(app.AlgorithmProjectUIFigure);
            app.Speed.HandleVisibility = 'off';
            app.Speed.Interruptible = 'off';
            app.Speed.Visible = 'off';
            app.Speed.Position = [779 417 35 22];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.AlgorithmProjectUIFigure);
            app.TabGroup.HandleVisibility = 'callback';
            app.TabGroup.Position = [2 -9 910 704];

            % Create tab_Menu
            app.tab_Menu = uitab(app.TabGroup);
            app.tab_Menu.Title = 'Algorithm Project';
            app.tab_Menu.BackgroundColor = [0.1294 0.3882 0.5882];

            % Create TheSortingProgramButton
            app.TheSortingProgramButton = uibutton(app.tab_Menu, 'push');
            app.TheSortingProgramButton.ButtonPushedFcn = createCallbackFcn(app, @TheSortingProgramButtonPushed, true);
            app.TheSortingProgramButton.Position = [361 410 159 38];
            app.TheSortingProgramButton.Text = 'The Sorting Program';

            % Create FibonacciFinderProgramButton
            app.FibonacciFinderProgramButton = uibutton(app.tab_Menu, 'push');
            app.FibonacciFinderProgramButton.ButtonPushedFcn = createCallbackFcn(app, @FibonacciFinderProgramButtonPushed, true);
            app.FibonacciFinderProgramButton.Position = [361 348 159 38];
            app.FibonacciFinderProgramButton.Text = 'Fibonacci Finder Program';

            % Create SpeedCompareProgramButton
            app.SpeedCompareProgramButton = uibutton(app.tab_Menu, 'push');
            app.SpeedCompareProgramButton.ButtonPushedFcn = createCallbackFcn(app, @SpeedCompareProgramButtonPushed, true);
            app.SpeedCompareProgramButton.Position = [361 286 159 38];
            app.SpeedCompareProgramButton.Text = 'Speed Compare Program';

            % Create AlgorithmProjectLabel
            app.AlgorithmProjectLabel = uilabel(app.tab_Menu);
            app.AlgorithmProjectLabel.HorizontalAlignment = 'center';
            app.AlgorithmProjectLabel.FontSize = 30;
            app.AlgorithmProjectLabel.FontColor = [1 1 1];
            app.AlgorithmProjectLabel.Position = [179 545 521 74];
            app.AlgorithmProjectLabel.Text = 'Algorithm Project';

            % Create ahinAlpAkosmanLabel
            app.ahinAlpAkosmanLabel = uilabel(app.tab_Menu);
            app.ahinAlpAkosmanLabel.FontColor = [1 1 1];
            app.ahinAlpAkosmanLabel.Position = [28 9 179 22];
            app.ahinAlpAkosmanLabel.Text = 'Şahin Alp Akosman';

            % Create Button
            app.Button = uibutton(app.tab_Menu, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Icon = fullfile(pathToMLAPP, 'icons', 'logo_ikcü.png');
            app.Button.Position = [698 312 114 174];
            app.Button.Text = '';

            % Create tab_main_sorting
            app.tab_main_sorting = uitab(app.TabGroup);
            app.tab_main_sorting.Title = 'Sorting Algorithm';
            app.tab_main_sorting.BackgroundColor = [0.5216 0.0196 0.1961];

            % Create UIAxes
            app.UIAxes = uiaxes(app.tab_main_sorting);
            title(app.UIAxes, 'The Sorting Program')
            xlabel(app.UIAxes, 'Index')
            ylabel(app.UIAxes, 'Values')
            app.UIAxes.PlotBoxAspectRatio = [2.35154394299287 1 1];
            app.UIAxes.XTickLabelRotation = 0;
            app.UIAxes.YTickLabelRotation = 0;
            app.UIAxes.ZTickLabelRotation = 0;
            app.UIAxes.Position = [25 65 840 392];

            % Create SpeedKnobLabel
            app.SpeedKnobLabel = uilabel(app.tab_main_sorting);
            app.SpeedKnobLabel.HorizontalAlignment = 'center';
            app.SpeedKnobLabel.FontColor = [1 1 1];
            app.SpeedKnobLabel.Position = [694 534 40 22];
            app.SpeedKnobLabel.Text = 'Speed';

            % Create SpeedKnob
            app.SpeedKnob = uiknob(app.tab_main_sorting, 'discrete');
            app.SpeedKnob.Items = {'Clear', 'Minimum', 'Medium', 'Maximum', 'Pause'};
            app.SpeedKnob.ValueChangedFcn = createCallbackFcn(app, @SpeedKnobValueChanged, true);
            app.SpeedKnob.FontColor = [1 1 1];
            app.SpeedKnob.Position = [683 571 60 60];
            app.SpeedKnob.Value = 'Minimum';

            % Create YourArrayLabel
            app.YourArrayLabel = uilabel(app.tab_main_sorting);
            app.YourArrayLabel.FontWeight = 'bold';
            app.YourArrayLabel.FontColor = [1 1 1];
            app.YourArrayLabel.Visible = 'off';
            app.YourArrayLabel.Position = [294 604 301 57];
            app.YourArrayLabel.Text = 'Your Array';

            % Create SortedArrayLabel
            app.SortedArrayLabel = uilabel(app.tab_main_sorting);
            app.SortedArrayLabel.FontWeight = 'bold';
            app.SortedArrayLabel.FontColor = [1 1 1];
            app.SortedArrayLabel.Visible = 'off';
            app.SortedArrayLabel.Position = [294 534 301 53];
            app.SortedArrayLabel.Text = 'Sorted Array';

            % Create LowRangeSpinnerLabel
            app.LowRangeSpinnerLabel = uilabel(app.tab_main_sorting);
            app.LowRangeSpinnerLabel.HorizontalAlignment = 'right';
            app.LowRangeSpinnerLabel.FontColor = [1 1 1];
            app.LowRangeSpinnerLabel.Position = [70 634 66 22];
            app.LowRangeSpinnerLabel.Text = 'Low Range';

            % Create LowRangeSpinner
            app.LowRangeSpinner = uispinner(app.tab_main_sorting);
            app.LowRangeSpinner.Limits = [1 Inf];
            app.LowRangeSpinner.FontWeight = 'bold';
            app.LowRangeSpinner.BackgroundColor = [0.7686 0.7686 0.7686];
            app.LowRangeSpinner.Position = [151 634 100 22];
            app.LowRangeSpinner.Value = 1;

            % Create HighRangeSpinnerLabel
            app.HighRangeSpinnerLabel = uilabel(app.tab_main_sorting);
            app.HighRangeSpinnerLabel.HorizontalAlignment = 'right';
            app.HighRangeSpinnerLabel.FontColor = [1 1 1];
            app.HighRangeSpinnerLabel.Position = [70 583 69 22];
            app.HighRangeSpinnerLabel.Text = 'High Range';

            % Create HighRangeSpinner
            app.HighRangeSpinner = uispinner(app.tab_main_sorting);
            app.HighRangeSpinner.Limits = [0 Inf];
            app.HighRangeSpinner.FontWeight = 'bold';
            app.HighRangeSpinner.BackgroundColor = [0.7686 0.7686 0.7686];
            app.HighRangeSpinner.Position = [154 583 100 22];
            app.HighRangeSpinner.Value = 100;

            % Create HowmanynumberdoyouwantLabel
            app.HowmanynumberdoyouwantLabel = uilabel(app.tab_main_sorting);
            app.HowmanynumberdoyouwantLabel.HorizontalAlignment = 'right';
            app.HowmanynumberdoyouwantLabel.FontColor = [1 1 1];
            app.HowmanynumberdoyouwantLabel.Position = [35 508 104 51];
            app.HowmanynumberdoyouwantLabel.Text = {'How many number'; 'do you want?'};

            % Create HowmanynumberdoyouwantSpinner
            app.HowmanynumberdoyouwantSpinner = uispinner(app.tab_main_sorting);
            app.HowmanynumberdoyouwantSpinner.Limits = [0 Inf];
            app.HowmanynumberdoyouwantSpinner.FontWeight = 'bold';
            app.HowmanynumberdoyouwantSpinner.BackgroundColor = [0.7686 0.7686 0.7686];
            app.HowmanynumberdoyouwantSpinner.Position = [151 522 100 22];
            app.HowmanynumberdoyouwantSpinner.Value = 99;

            % Create EnterButton
            app.EnterButton = uibutton(app.tab_main_sorting, 'push');
            app.EnterButton.ButtonPushedFcn = createCallbackFcn(app, @EnterButtonPushed, true);
            app.EnterButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.EnterButton.Position = [86 466 100 22];
            app.EnterButton.Text = 'Enter';

            % Create InsertionButton
            app.InsertionButton = uibutton(app.tab_main_sorting, 'push');
            app.InsertionButton.ButtonPushedFcn = createCallbackFcn(app, @InsertionButtonPushed, true);
            app.InsertionButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.InsertionButton.FontWeight = 'bold';
            app.InsertionButton.Position = [216 466 66 22];
            app.InsertionButton.Text = 'Insertion';

            % Create MergeButton
            app.MergeButton = uibutton(app.tab_main_sorting, 'push');
            app.MergeButton.ButtonPushedFcn = createCallbackFcn(app, @MergeButtonPushed, true);
            app.MergeButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.MergeButton.FontWeight = 'bold';
            app.MergeButton.Position = [277 466 59 22];
            app.MergeButton.Text = 'Merge';

            % Create BubbleButton
            app.BubbleButton = uibutton(app.tab_main_sorting, 'push');
            app.BubbleButton.ButtonPushedFcn = createCallbackFcn(app, @BubbleButtonPushed, true);
            app.BubbleButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.BubbleButton.FontWeight = 'bold';
            app.BubbleButton.Position = [335 466 59 22];
            app.BubbleButton.Text = 'Bubble';

            % Create SelectionButton
            app.SelectionButton = uibutton(app.tab_main_sorting, 'push');
            app.SelectionButton.ButtonPushedFcn = createCallbackFcn(app, @SelectionButtonPushed, true);
            app.SelectionButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.SelectionButton.FontWeight = 'bold';
            app.SelectionButton.Position = [388 466 69 22];
            app.SelectionButton.Text = 'Selection';

            % Create QuickButton
            app.QuickButton = uibutton(app.tab_main_sorting, 'push');
            app.QuickButton.ButtonPushedFcn = createCallbackFcn(app, @QuickButtonPushed, true);
            app.QuickButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.QuickButton.FontWeight = 'bold';
            app.QuickButton.Position = [451 466 59 22];
            app.QuickButton.Text = 'Quick';

            % Create HeapButton
            app.HeapButton = uibutton(app.tab_main_sorting, 'push');
            app.HeapButton.ButtonPushedFcn = createCallbackFcn(app, @HeapButtonPushed, true);
            app.HeapButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.HeapButton.FontWeight = 'bold';
            app.HeapButton.Position = [509 466 59 22];
            app.HeapButton.Text = 'Heap';

            % Create CountingButton
            app.CountingButton = uibutton(app.tab_main_sorting, 'push');
            app.CountingButton.ButtonPushedFcn = createCallbackFcn(app, @CountingButtonPushed, true);
            app.CountingButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.CountingButton.FontWeight = 'bold';
            app.CountingButton.Position = [567 466 68 22];
            app.CountingButton.Text = 'Counting';

            % Create RadixButton
            app.RadixButton = uibutton(app.tab_main_sorting, 'push');
            app.RadixButton.ButtonPushedFcn = createCallbackFcn(app, @RadixButtonPushed, true);
            app.RadixButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.RadixButton.FontWeight = 'bold';
            app.RadixButton.Position = [633 466 59 22];
            app.RadixButton.Text = 'Radix';

            % Create BucketButton
            app.BucketButton = uibutton(app.tab_main_sorting, 'push');
            app.BucketButton.ButtonPushedFcn = createCallbackFcn(app, @BucketButtonPushed, true);
            app.BucketButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.BucketButton.FontWeight = 'bold';
            app.BucketButton.Position = [691 466 69 22];
            app.BucketButton.Text = 'Bucket';

            % Create BacktoMenuButton
            app.BacktoMenuButton = uibutton(app.tab_main_sorting, 'push');
            app.BacktoMenuButton.ButtonPushedFcn = createCallbackFcn(app, @BacktoMenuButtonPushed, true);
            app.BacktoMenuButton.Position = [757 26 100 28];
            app.BacktoMenuButton.Text = 'Back to Menu';

            % Create Lamp
            app.Lamp = uilamp(app.tab_main_sorting);
            app.Lamp.Enable = 'off';
            app.Lamp.Position = [774 509 20 20];
            app.Lamp.Color = [1 1 0];

            % Create HelpButton
            app.HelpButton = uibutton(app.tab_main_sorting, 'push');
            app.HelpButton.ButtonPushedFcn = createCallbackFcn(app, @HelpButtonPushed, true);
            app.HelpButton.BackgroundColor = [0.7686 0.7686 0.7686];
            app.HelpButton.Position = [803 466 62 22];
            app.HelpButton.Text = 'Help';

            % Create label_lamb
            app.label_lamb = uilabel(app.tab_main_sorting);
            app.label_lamb.FontColor = [1 1 1];
            app.label_lamb.Position = [719 508 53 22];
            app.label_lamb.Text = '';

            % Create YourArrayTextAreaLabel
            app.YourArrayTextAreaLabel = uilabel(app.tab_main_sorting);
            app.YourArrayTextAreaLabel.HorizontalAlignment = 'right';
            app.YourArrayTextAreaLabel.FontColor = [1 1 1];
            app.YourArrayTextAreaLabel.Position = [302 614 62 22];
            app.YourArrayTextAreaLabel.Text = 'Your Array';

            % Create YourArrayTextArea
            app.YourArrayTextArea = uitextarea(app.tab_main_sorting);
            app.YourArrayTextArea.Position = [380 595 192 60];

            % Create YourSortedArrayTextAreaLabel
            app.YourSortedArrayTextAreaLabel = uilabel(app.tab_main_sorting);
            app.YourSortedArrayTextAreaLabel.HorizontalAlignment = 'right';
            app.YourSortedArrayTextAreaLabel.FontColor = [1 1 1];
            app.YourSortedArrayTextAreaLabel.Position = [266 541 100 22];
            app.YourSortedArrayTextAreaLabel.Text = 'Your Sorted Array';

            % Create YourSortedArrayTextArea
            app.YourSortedArrayTextArea = uitextarea(app.tab_main_sorting);
            app.YourSortedArrayTextArea.Position = [381 522 192 60];

            % Create tab_fibonacci
            app.tab_fibonacci = uitab(app.TabGroup);
            app.tab_fibonacci.SizeChangedFcn = createCallbackFcn(app, @tab_fibonacciSizeChanged, true);
            app.tab_fibonacci.Title = 'Fibonacci Algorithm';
            app.tab_fibonacci.BackgroundColor = [0.0667 0.2118 0.1137];

            % Create graph_fib
            app.graph_fib = uiaxes(app.tab_fibonacci);
            xlabel(app.graph_fib, 'Index')
            ylabel(app.graph_fib, 'Values')
            app.graph_fib.PlotBoxAspectRatio = [1.49411764705882 1 1];
            app.graph_fib.XTickLabelRotation = 0;
            app.graph_fib.YTickLabelRotation = 0;
            app.graph_fib.ZTickLabelRotation = 0;
            app.graph_fib.Position = [331 65 556 383];

            % Create BacktoMenuButton_4
            app.BacktoMenuButton_4 = uibutton(app.tab_fibonacci, 'push');
            app.BacktoMenuButton_4.ButtonPushedFcn = createCallbackFcn(app, @BacktoMenuButton_4Pushed, true);
            app.BacktoMenuButton_4.Position = [757 26 100 28];
            app.BacktoMenuButton_4.Text = 'Back to Menu';

            % Create StartButton_2
            app.StartButton_2 = uibutton(app.tab_fibonacci, 'push');
            app.StartButton_2.ButtonPushedFcn = createCallbackFcn(app, @StartButton_2Pushed, true);
            app.StartButton_2.Position = [126 464 100 22];
            app.StartButton_2.Text = 'Start';

            % Create WhatvaluedoyouwantSpinner
            app.WhatvaluedoyouwantSpinner = uispinner(app.tab_fibonacci);
            app.WhatvaluedoyouwantSpinner.Limits = [1 Inf];
            app.WhatvaluedoyouwantSpinner.FontWeight = 'bold';
            app.WhatvaluedoyouwantSpinner.FontColor = [0.149 0.149 0.149];
            app.WhatvaluedoyouwantSpinner.Position = [187 522 100 22];
            app.WhatvaluedoyouwantSpinner.Value = 1;

            % Create WhatvaluedoyouwantSpinnerLabel
            app.WhatvaluedoyouwantSpinnerLabel = uilabel(app.tab_fibonacci);
            app.WhatvaluedoyouwantSpinnerLabel.HorizontalAlignment = 'right';
            app.WhatvaluedoyouwantSpinnerLabel.FontWeight = 'bold';
            app.WhatvaluedoyouwantSpinnerLabel.FontColor = [1 1 1];
            app.WhatvaluedoyouwantSpinnerLabel.Position = [23 522 149 22];
            app.WhatvaluedoyouwantSpinnerLabel.Text = 'What value do you want?';

            % Create output1Label
            app.output1Label = uilabel(app.tab_fibonacci);
            app.output1Label.FontWeight = 'bold';
            app.output1Label.FontColor = [1 1 1];
            app.output1Label.Visible = 'off';
            app.output1Label.Position = [94 82 164 356];
            app.output1Label.Text = 'output1';

            % Create tab_compare
            app.tab_compare = uitab(app.TabGroup);
            app.tab_compare.Title = 'Speed Comparison';
            app.tab_compare.BackgroundColor = [0.8392 0.3647 0.1608];

            % Create UI_compare
            app.UI_compare = uiaxes(app.tab_compare);
            xlabel(app.UI_compare, 'Repeat time')
            ylabel(app.UI_compare, 'Time (second)')
            app.UI_compare.PlotBoxAspectRatio = [1.36065573770492 1 1];
            app.UI_compare.XTickLabelRotation = 0;
            app.UI_compare.YTickLabelRotation = 0;
            app.UI_compare.ZTickLabelRotation = 0;
            app.UI_compare.Position = [190 86 712 531];

            % Create SortingAlgorithmsButtonGroup
            app.SortingAlgorithmsButtonGroup = uibuttongroup(app.tab_compare);
            app.SortingAlgorithmsButtonGroup.ForegroundColor = [1 1 1];
            app.SortingAlgorithmsButtonGroup.Title = 'Sorting Algorithms';
            app.SortingAlgorithmsButtonGroup.BackgroundColor = [0.102 0.0588 0.3216];
            app.SortingAlgorithmsButtonGroup.Scrollable = 'on';
            app.SortingAlgorithmsButtonGroup.Position = [41 213 123 231];

            % Create InsertionSortCheckBox
            app.InsertionSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.InsertionSortCheckBox.Text = 'Insertion Sort';
            app.InsertionSortCheckBox.FontColor = [1 1 1];
            app.InsertionSortCheckBox.Position = [13 180 93 22];

            % Create MergeSortCheckBox
            app.MergeSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.MergeSortCheckBox.Text = 'Merge Sort';
            app.MergeSortCheckBox.FontColor = [1 1 1];
            app.MergeSortCheckBox.Position = [13 159 81 22];

            % Create BubbleSortCheckBox
            app.BubbleSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.BubbleSortCheckBox.Text = 'Bubble Sort';
            app.BubbleSortCheckBox.FontColor = [1 1 1];
            app.BubbleSortCheckBox.Position = [13 138 85 22];

            % Create SelectionSortCheckBox
            app.SelectionSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.SelectionSortCheckBox.Text = 'Selection Sort';
            app.SelectionSortCheckBox.FontColor = [1 1 1];
            app.SelectionSortCheckBox.Position = [13 117 97 22];

            % Create QuickSortCheckBox
            app.QuickSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.QuickSortCheckBox.Text = 'Quick Sort';
            app.QuickSortCheckBox.FontColor = [1 1 1];
            app.QuickSortCheckBox.Position = [13 96 78 22];

            % Create HeapSortCheckBox
            app.HeapSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.HeapSortCheckBox.Text = 'Heap Sort';
            app.HeapSortCheckBox.FontColor = [1 1 1];
            app.HeapSortCheckBox.Position = [13 75 76 22];

            % Create CountingSortCheckBox
            app.CountingSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.CountingSortCheckBox.Text = 'Counting Sort';
            app.CountingSortCheckBox.FontColor = [1 1 1];
            app.CountingSortCheckBox.Position = [13 54 95 22];

            % Create RadixSortCheckBox
            app.RadixSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.RadixSortCheckBox.Text = 'Radix Sort';
            app.RadixSortCheckBox.FontColor = [1 1 1];
            app.RadixSortCheckBox.Position = [13 33 78 22];

            % Create BucketSortCheckBox
            app.BucketSortCheckBox = uicheckbox(app.SortingAlgorithmsButtonGroup);
            app.BucketSortCheckBox.Text = 'Bucket Sort';
            app.BucketSortCheckBox.FontColor = [1 1 1];
            app.BucketSortCheckBox.Position = [13 12 84 22];

            % Create BacktoMenuButton_2
            app.BacktoMenuButton_2 = uibutton(app.tab_compare, 'push');
            app.BacktoMenuButton_2.ButtonPushedFcn = createCallbackFcn(app, @BacktoMenuButton_2Pushed, true);
            app.BacktoMenuButton_2.Position = [757 26 100 28];
            app.BacktoMenuButton_2.Text = 'Back to Menu';

            % Create SelectAllButton
            app.SelectAllButton = uibutton(app.tab_compare, 'push');
            app.SelectAllButton.ButtonPushedFcn = createCallbackFcn(app, @SelectAllButtonPushed, true);
            app.SelectAllButton.BackgroundColor = [0.098 0.0627 0.3216];
            app.SelectAllButton.FontColor = [1 1 1];
            app.SelectAllButton.Position = [53 180 100 22];
            app.SelectAllButton.Text = 'Select All';

            % Create RemoveAllButton
            app.RemoveAllButton = uibutton(app.tab_compare, 'push');
            app.RemoveAllButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveAllButtonPushed, true);
            app.RemoveAllButton.BackgroundColor = [0.098 0.0627 0.3216];
            app.RemoveAllButton.FontColor = [1 1 1];
            app.RemoveAllButton.Position = [53 148 100 22];
            app.RemoveAllButton.Text = 'Remove All';

            % Create CompareButton
            app.CompareButton = uibutton(app.tab_compare, 'push');
            app.CompareButton.ButtonPushedFcn = createCallbackFcn(app, @CompareButtonPushed, true);
            app.CompareButton.BackgroundColor = [0.098 0.0627 0.3216];
            app.CompareButton.FontColor = [1 1 1];
            app.CompareButton.Position = [53 88 100 22];
            app.CompareButton.Text = 'Compare';

            % Create LowRangeSpinner_2Label
            app.LowRangeSpinner_2Label = uilabel(app.tab_compare);
            app.LowRangeSpinner_2Label.HorizontalAlignment = 'right';
            app.LowRangeSpinner_2Label.FontColor = [1 1 0.0667];
            app.LowRangeSpinner_2Label.Position = [31 628 66 22];
            app.LowRangeSpinner_2Label.Text = 'Low Range';

            % Create LowRangeSpinner_2
            app.LowRangeSpinner_2 = uispinner(app.tab_compare);
            app.LowRangeSpinner_2.Limits = [1 Inf];
            app.LowRangeSpinner_2.FontWeight = 'bold';
            app.LowRangeSpinner_2.FontColor = [0.149 0.149 0.149];
            app.LowRangeSpinner_2.Position = [112 628 60 22];
            app.LowRangeSpinner_2.Value = 1;

            % Create HighRangeSpinner_2Label
            app.HighRangeSpinner_2Label = uilabel(app.tab_compare);
            app.HighRangeSpinner_2Label.HorizontalAlignment = 'right';
            app.HighRangeSpinner_2Label.FontColor = [1 1 0];
            app.HighRangeSpinner_2Label.Position = [23 575 69 22];
            app.HighRangeSpinner_2Label.Text = 'High Range';

            % Create HighRangeSpinner_2
            app.HighRangeSpinner_2 = uispinner(app.tab_compare);
            app.HighRangeSpinner_2.Limits = [2 Inf];
            app.HighRangeSpinner_2.FontWeight = 'bold';
            app.HighRangeSpinner_2.Position = [112 575 63 22];
            app.HighRangeSpinner_2.Value = 20;

            % Create HowmanynumberdoyouwantLabel_2
            app.HowmanynumberdoyouwantLabel_2 = uilabel(app.tab_compare);
            app.HowmanynumberdoyouwantLabel_2.HorizontalAlignment = 'right';
            app.HowmanynumberdoyouwantLabel_2.FontColor = [1 1 0];
            app.HowmanynumberdoyouwantLabel_2.Position = [20 502 80 51];
            app.HowmanynumberdoyouwantLabel_2.Text = {'How many'; 'number'; 'do you want?'};

            % Create HowmanynumberdoyouwantSpinner_2
            app.HowmanynumberdoyouwantSpinner_2 = uispinner(app.tab_compare);
            app.HowmanynumberdoyouwantSpinner_2.Limits = [1 Inf];
            app.HowmanynumberdoyouwantSpinner_2.FontWeight = 'bold';
            app.HowmanynumberdoyouwantSpinner_2.Position = [112 516 62 22];
            app.HowmanynumberdoyouwantSpinner_2.Value = 19;

            % Create GetarandomarrayButton
            app.GetarandomarrayButton = uibutton(app.tab_compare, 'push');
            app.GetarandomarrayButton.ButtonPushedFcn = createCallbackFcn(app, @GetarandomarrayButtonPushed, true);
            app.GetarandomarrayButton.BackgroundColor = [0.102 0.0588 0.3216];
            app.GetarandomarrayButton.FontColor = [1 1 1];
            app.GetarandomarrayButton.Position = [44 457 120 31];
            app.GetarandomarrayButton.Text = 'Get a random array';

            % Create label_input
            app.label_input = uilabel(app.tab_compare);
            app.label_input.Visible = 'off';
            app.label_input.Position = [5 5 20 14];
            app.label_input.Text = 'Label2';

            % Create label_output
            app.label_output = uilabel(app.tab_compare);
            app.label_output.Visible = 'off';
            app.label_output.Position = [52 5 41 22];
            app.label_output.Text = 'Label3';

            % Create RepeatTimeLabel
            app.RepeatTimeLabel = uilabel(app.tab_compare);
            app.RepeatTimeLabel.HorizontalAlignment = 'right';
            app.RepeatTimeLabel.FontColor = [1 1 0];
            app.RepeatTimeLabel.Position = [18 117 78 22];
            app.RepeatTimeLabel.Text = 'Repeat Time';

            % Create RepeatTimeSpinner
            app.RepeatTimeSpinner = uispinner(app.tab_compare);
            app.RepeatTimeSpinner.Limits = [5 15];
            app.RepeatTimeSpinner.FontWeight = 'bold';
            app.RepeatTimeSpinner.Position = [112 117 61 22];
            app.RepeatTimeSpinner.Value = 5;

            % Create ClearButton
            app.ClearButton = uibutton(app.tab_compare, 'push');
            app.ClearButton.ButtonPushedFcn = createCallbackFcn(app, @ClearButtonPushed, true);
            app.ClearButton.BackgroundColor = [0.098 0.0627 0.3216];
            app.ClearButton.FontColor = [1 1 1];
            app.ClearButton.Position = [54 54 100 22];
            app.ClearButton.Text = 'Clear';

            % Create Image
            app.Image = uiimage(app.tab_compare);
            app.Image.Position = [777 485 125 132];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'icons', 'SORTING.png');

            % Create tab_help_sorting
            app.tab_help_sorting = uitab(app.TabGroup);
            app.tab_help_sorting.Title = 'Help';
            app.tab_help_sorting.BackgroundColor = [0.9098 0.0549 0.0549];

            % Create BackButton
            app.BackButton = uibutton(app.tab_help_sorting, 'push');
            app.BackButton.ButtonPushedFcn = createCallbackFcn(app, @BackButtonPushed, true);
            app.BackButton.Position = [757 26 100 28];
            app.BackButton.Text = 'Back';

            % Create HowCanIHelpYouLabel
            app.HowCanIHelpYouLabel = uilabel(app.tab_help_sorting);
            app.HowCanIHelpYouLabel.HorizontalAlignment = 'center';
            app.HowCanIHelpYouLabel.FontSize = 18;
            app.HowCanIHelpYouLabel.FontColor = [1 1 1];
            app.HowCanIHelpYouLabel.Position = [349 617 176 23];
            app.HowCanIHelpYouLabel.Text = 'How Can I Help You?';

            % Create DropDown
            app.DropDown = uidropdown(app.tab_help_sorting);
            app.DropDown.Items = {'What is insertion sort?', 'What is merge sort?', 'What is bubble sort?', 'What is selection sort?', 'What is quick sort?', 'What is heap sort?', 'What is counting sort?', 'What is radix sort?', 'What is bucket sort?'};
            app.DropDown.ValueChangedFcn = createCallbackFcn(app, @DropDownValueChanged, true);
            app.DropDown.Position = [354 584 167 22];
            app.DropDown.Value = 'What is insertion sort?';

            % Create TextArea
            app.TextArea = uitextarea(app.tab_help_sorting);
            app.TextArea.Editable = 'off';
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea.Position = [76 483 722 82];
            app.TextArea.Value = {'Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time.It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort'};

            % Create insertion_gif
            app.insertion_gif = uiimage(app.tab_help_sorting);
            app.insertion_gif.Position = [87 87 691 340];
            app.insertion_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'Insertion_sort.gif');

            % Create merge_gif
            app.merge_gif = uiimage(app.tab_help_sorting);
            app.merge_gif.Visible = 'off';
            app.merge_gif.Position = [93 87 691 340];
            app.merge_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'merge_sort.gif');

            % Create bubble_gif
            app.bubble_gif = uiimage(app.tab_help_sorting);
            app.bubble_gif.Visible = 'off';
            app.bubble_gif.Position = [87 87 691 340];
            app.bubble_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'bubble_sort.gif');

            % Create selection_gif
            app.selection_gif = uiimage(app.tab_help_sorting);
            app.selection_gif.Visible = 'off';
            app.selection_gif.Position = [88 86 691 341];
            app.selection_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'Selection-Sort.gif');

            % Create quick_gif
            app.quick_gif = uiimage(app.tab_help_sorting);
            app.quick_gif.Visible = 'off';
            app.quick_gif.Position = [87 85 691 342];
            app.quick_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'quick_sort.gif');

            % Create heap_gif
            app.heap_gif = uiimage(app.tab_help_sorting);
            app.heap_gif.Visible = 'off';
            app.heap_gif.Position = [87 84 691 343];
            app.heap_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'heap_sort.gif');

            % Create count_gif
            app.count_gif = uiimage(app.tab_help_sorting);
            app.count_gif.Visible = 'off';
            app.count_gif.Position = [88 85 691 342];
            app.count_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'counting_sort.gif');

            % Create radix_gif
            app.radix_gif = uiimage(app.tab_help_sorting);
            app.radix_gif.Visible = 'off';
            app.radix_gif.Position = [87 83 691 344];
            app.radix_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'radix_sort.gif');

            % Create bucket_gif
            app.bucket_gif = uiimage(app.tab_help_sorting);
            app.bucket_gif.Visible = 'off';
            app.bucket_gif.Position = [89 83 691 344];
            app.bucket_gif.ImageSource = fullfile(pathToMLAPP, 'icons', 'bucket_sort.gif');

            % Show the figure after all components are created
            app.AlgorithmProjectUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Sorting_algorithm_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.AlgorithmProjectUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.AlgorithmProjectUIFigure)
        end
    end
end