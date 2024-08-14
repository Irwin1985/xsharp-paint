USING System.Windows.Forms
USING System.Drawing

CLASS BasicForm INHERIT System.Windows.Forms.Form

	PROTECT oPanel1 AS System.Windows.Forms.Panel
	PROTECT oPanel2 AS System.Windows.Forms.Panel
	PROTECT oPictureBox4 AS System.Windows.Forms.PictureBox
	PROTECT oPictureBox3 AS System.Windows.Forms.PictureBox
	PROTECT oPictureBox2 AS System.Windows.Forms.PictureBox
	PROTECT oPictureBox1 AS System.Windows.Forms.PictureBox
	// User code starts here (DO NOT remove this line)  ##USER##
    PRIVATE g AS Graphics 
    PRIVATE x := -1 AS INT
    PRIVATE y := -1 AS INT
    PRIVATE moving AS LOGIC
    PRIVATE pen AS Pen
CONSTRUCTOR()

	SUPER()
	SELF:InitializeForm()
	g := oPanel1:CreateGraphics() 
	g:SmoothingMode := System.Drawing.Drawing2D.SmoothingMode.AntiAlias
	pen := Pen{Color.Black, 5}
	pen:StartCap := pen:EndCap := System.Drawing.Drawing2D.LineCap.Round
RETURN

METHOD InitializeForm() AS VOID
	
	// IDE generated code (please DO NOT modify)
	
		SELF:oPanel1 := System.Windows.Forms.Panel{}
		SELF:oPanel2 := System.Windows.Forms.Panel{}
		SELF:oPictureBox4 := System.Windows.Forms.PictureBox{}
		SELF:oPictureBox3 := System.Windows.Forms.PictureBox{}
		SELF:oPictureBox2 := System.Windows.Forms.PictureBox{}
		SELF:oPictureBox1 := System.Windows.Forms.PictureBox{}

		SELF:SuspendLayout()

		SELF:ClientSize := System.Drawing.Size{952 , 560}
		SELF:Location := System.Drawing.Point{100 , 100}
		SELF:Name := "BasicForm"
		SELF:Text := "XSharp Paint"

		SELF:oPanel1:SuspendLayout()
		SELF:oPanel1:BackColor := System.Drawing.Color.FromArgb( 255,255,255 )
		SELF:oPanel1:Dock := System.Windows.Forms.DockStyle.Fill
		SELF:oPanel1:Location := System.Drawing.Point{0 , 0}
		SELF:oPanel1:MouseDown += SELF:Panel1_MouseDown
		SELF:oPanel1:MouseMove += SELF:Panel1_MouseMove
		SELF:oPanel1:MouseUp += SELF:Panel1_MouseUp
		SELF:oPanel1:Name := "Panel1"
		SELF:oPanel1:Size := System.Drawing.Size{952 , 560}
		SELF:oPanel1:TabIndex := 0
		SELF:Controls:Add(SELF:oPanel1)
		

		SELF:oPanel2:SuspendLayout()
		SELF:oPanel2:BackColor := System.Drawing.Color.FromArgb( 85,85,85 )
		SELF:oPanel2:Location := System.Drawing.Point{768 , 8}
		SELF:oPanel2:Name := "Panel2"
		SELF:oPanel2:Size := System.Drawing.Size{168 , 48}
		SELF:oPanel2:TabIndex := 0
		SELF:oPanel1:Controls:Add(SELF:oPanel2)
		

		SELF:oPictureBox4:BackColor := System.Drawing.Color.FromArgb( 0,0,255 )
		SELF:oPictureBox4:Click += SELF:PictureBox1_Click
		SELF:oPictureBox4:Location := System.Drawing.Point{128 , 8}
		SELF:oPictureBox4:Name := "PictureBox4"
		SELF:oPictureBox4:Size := System.Drawing.Size{32 , 32}
		SELF:oPanel2:Controls:Add(SELF:oPictureBox4)
		
		SELF:oPictureBox3:BackColor := System.Drawing.Color.FromArgb( 0,255,0 )
		SELF:oPictureBox3:Click += SELF:PictureBox1_Click
		SELF:oPictureBox3:Location := System.Drawing.Point{88 , 8}
		SELF:oPictureBox3:Name := "PictureBox3"
		SELF:oPictureBox3:Size := System.Drawing.Size{32 , 32}
		SELF:oPanel2:Controls:Add(SELF:oPictureBox3)
		
		SELF:oPictureBox2:BackColor := System.Drawing.Color.Orange
		SELF:oPictureBox2:Click += SELF:PictureBox1_Click
		SELF:oPictureBox2:Location := System.Drawing.Point{48 , 8}
		SELF:oPictureBox2:Name := "PictureBox2"
		SELF:oPictureBox2:Size := System.Drawing.Size{32 , 32}
		SELF:oPanel2:Controls:Add(SELF:oPictureBox2)
		
		SELF:oPictureBox1:BackColor := System.Drawing.Color.FromArgb( 255,0,0 )
		SELF:oPictureBox1:Click += SELF:PictureBox1_Click
		SELF:oPictureBox1:Location := System.Drawing.Point{8 , 8}
		SELF:oPictureBox1:Name := "PictureBox1"
		SELF:oPictureBox1:Size := System.Drawing.Size{32 , 32}
		SELF:oPanel2:Controls:Add(SELF:oPictureBox1)
		
		SELF:oPanel2:ResumeLayout()
		SELF:oPanel1:ResumeLayout()
		SELF:ResumeLayout()

	END METHOD

METHOD OKButtonClick(sender AS OBJECT , e AS System.EventArgs) AS VOID

	SELF:Close()

RETURN


	METHOD PictureBox1_Click(sender AS System.Object , e AS System.EventArgs) AS VOID
		LOCAL p := (PictureBox)sender AS PictureBox
		pen:Color := p:BackColor
	END METHOD


	METHOD Panel1_MouseDown(sender AS System.Object , e AS System.Windows.Forms.MouseEventArgs) AS VOID
		moving := TRUE
		x := e:X
		y := e:y
		oPanel1:Cursor := Cursors.Cross
	END METHOD


	METHOD Panel1_MouseUp(sender AS System.Object , e AS System.Windows.Forms.MouseEventArgs) AS VOID
		moving := FALSE
		x := -1
		y := -1
		oPanel1:Cursor := Cursors.Default
	END METHOD


	METHOD Panel1_MouseMove(sender AS System.Object , e AS System.Windows.Forms.MouseEventArgs) AS VOID
		IF moving && x != -1 && y != -1
			g:DrawLine(pen, Point{x, y}, e:Location)
			x := e:X
			y := e:Y
		ENDIF
			
	END METHOD


END CLASS

