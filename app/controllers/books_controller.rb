class BooksController < ApplicationController
  
  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if@book.save
       # 4. show画面へリダイレクト
       redirect_to book_path(book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  #editアクション内の@listがインスタンス変数であるのは、コントローラーからViewファイルに渡され、Viewファイルがインスタンス変数を参照する必要があるから
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end
  
  #一方updateアクションでは、リストの情報を更新しています。
#更新後にリダイレクトするため、変数をViewファイルに渡す必要がありません。
#このためlistという変数はupdateアクション内だけで使用するために、ローカル変数となっています。
  
  def destory
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト  
  end
  
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
