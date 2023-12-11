workflow running_geneformer {

    String token_outprefix
    File task1_script
    File loom_inpath
    File gene_median_dictionary_pkl
    File token_dictionary_pkl
    
    call tokenise { 
    input: 
        loom_inpath=loom_inpath, 
        token_outprefix=token_outprefix,
        task1_script=task1_script,
        gene_median_dictionary_pkl=gene_median_dictionary_pkl, 
        token_dictionary_pkl=token_dictionary_pkl,
    }
}

# -------------------------------------------------------------------------
# TASK1: tokenise the loom file
# -------------------------------------------------------------------------

task tokenise {
	
    File task1_script
    String token_outprefix
    File loom_inpath
    File gene_median_dictionary_pkl
    File token_dictionary_pkl
    
    command {   
        echo "Starting the tokenise task with loom input path "${loom_inpath}
		echo "Running "${task1_script}
    	python3 ${task1_script} ${token_outprefix} ${loom_inpath} ${gene_median_dictionary_pkl} ${token_dictionary_pkl}
    }
    
    output {
		Array[File] directoryContents = glob("${token_outprefix}/${token_outprefix}/*")
    }
    
    runtime {
    	docker: "amcalejandro/geneformer:tokenise_v1"
        memory: "6 GB"
        disks: "local-disk 10 HDD"
        cpu: 2
        preemptible: 3
    }

    meta {
        author: "Aine Fairbrother-Browne, Alejandro Carrasco"
        email: "aine.fairbrother-browne.18@ucl.ac.uk"
    }
}

# ------------------------------------------------------