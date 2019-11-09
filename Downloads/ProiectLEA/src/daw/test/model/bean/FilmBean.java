/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.model.bean;

/**
 *
 * @author adria
 */
public class FilmBean {
    private int idFilm;
    private int idUser;
    private String nume;
    private String an;
    private String genul;
    private String durata;
    private String descriere;
    private String actori;
    private String format;
    private String traducere;
    private String poza;
    private String video;

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getAn() {
        return an;
    }

    public void setAn(String an) {
        this.an = an;
    }

    public int getIdFilm() {
        return idFilm;
    }

    public void setIdFilm(int idFilm) {
        this.idFilm = idFilm;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getGenul() {
        return genul;
    }

    public void setGenul(String genul) {
        this.genul = genul;
    }

    public String getDurata() {
        return durata;
    }

    public void setDurata(String durata) {
        this.durata = durata;
    }

    public String getDescriere() {
        return descriere;
    }

    public void setDescriere(String descriere) {
        this.descriere = descriere;
    }

    public String getActori() {
        return actori;
    }

    public void setActori(String actori) {
        this.actori = actori;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getTraducere() {
        return traducere;
    }

    public void setTraducere(String traducere) {
        this.traducere = traducere;
    }

    public String getPoza() {
        return poza;
    }

    public void setPoza(String poza) {
        this.poza = poza;
    }
}
