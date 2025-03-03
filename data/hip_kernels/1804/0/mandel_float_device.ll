; ModuleID = '../data/hip_kernels/1804/0/main.cu'
source_filename = "../data/hip_kernels/1804/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

@_ZL7viridis = internal unnamed_addr addrspace(1) constant [256 x [3 x i8]] [[3 x i8] c"T\01D", [3 x i8] c"U\02D", [3 x i8] c"W\03E", [3 x i8] c"X\05E", [3 x i8] c"Z\06E", [3 x i8] c"[\08F", [3 x i8] c"]\09F", [3 x i8] c"^\0BF", [3 x i8] c"`\0CF", [3 x i8] c"a\0EG", [3 x i8] c"b\0FG", [3 x i8] c"d\11G", [3 x i8] c"e\12G", [3 x i8] c"f\14G", [3 x i8] c"h\15H", [3 x i8] c"i\16H", [3 x i8] c"j\18H", [3 x i8] c"l\19H", [3 x i8] c"m\1AH", [3 x i8] c"n\1CH", [3 x i8] c"o\1DH", [3 x i8] c"p\1EH", [3 x i8] c"q H", [3 x i8] c"s!H", [3 x i8] c"t\22H", [3 x i8] c"u$H", [3 x i8] c"v%H", [3 x i8] c"w&H", [3 x i8] c"x'H", [3 x i8] c"y)G", [3 x i8] c"y*G", [3 x i8] c"z+G", [3 x i8] c"{,G", [3 x i8] c"|.G", [3 x i8] c"}/F", [3 x i8] c"~0F", [3 x i8] c"~1F", [3 x i8] c"\7F3F", [3 x i8] c"\804E", [3 x i8] c"\815E", [3 x i8] c"\816E", [3 x i8] c"\828D", [3 x i8] c"\839D", [3 x i8] c"\83:D", [3 x i8] c"\84;C", [3 x i8] c"\84<C", [3 x i8] c"\85>C", [3 x i8] c"\85?B", [3 x i8] c"\86@B", [3 x i8] c"\86AA", [3 x i8] c"\87BA", [3 x i8] c"\87CA", [3 x i8] c"\88E@", [3 x i8] c"\88F@", [3 x i8] c"\88G?", [3 x i8] c"\89H?", [3 x i8] c"\89I>", [3 x i8] c"\89J>", [3 x i8] c"\8AK=", [3 x i8] c"\8AM=", [3 x i8] c"\8AN<", [3 x i8] c"\8AO<", [3 x i8] c"\8BP;", [3 x i8] c"\8BQ;", [3 x i8] c"\8BR:", [3 x i8] c"\8BS:", [3 x i8] c"\8CT9", [3 x i8] c"\8CU9", [3 x i8] c"\8CV8", [3 x i8] c"\8CW8", [3 x i8] c"\8CX7", [3 x i8] c"\8CY7", [3 x i8] c"\8D[6", [3 x i8] c"\8D\\6", [3 x i8] c"\8D]5", [3 x i8] c"\8D^5", [3 x i8] c"\8D_4", [3 x i8] c"\8D`4", [3 x i8] c"\8Da3", [3 x i8] c"\8Db3", [3 x i8] c"\8Dc3", [3 x i8] c"\8Ed2", [3 x i8] c"\8Ee2", [3 x i8] c"\8Ef1", [3 x i8] c"\8Eg1", [3 x i8] c"\8Eh0", [3 x i8] c"\8Ei0", [3 x i8] c"\8Ej/", [3 x i8] c"\8Ek/", [3 x i8] c"\8El/", [3 x i8] c"\8Em.", [3 x i8] c"\8En.", [3 x i8] c"\8Eo-", [3 x i8] c"\8Ep-", [3 x i8] c"\8Ep-", [3 x i8] c"\8Eq,", [3 x i8] c"\8Er,", [3 x i8] c"\8Es+", [3 x i8] c"\8Et+", [3 x i8] c"\8Eu+", [3 x i8] c"\8Ev*", [3 x i8] c"\8Ew*", [3 x i8] c"\8Ex)", [3 x i8] c"\8Ey)", [3 x i8] c"\8Ez)", [3 x i8] c"\8E{(", [3 x i8] c"\8E|(", [3 x i8] c"\8E}(", [3 x i8] c"\8E~'", [3 x i8] c"\8E\7F'", [3 x i8] c"\8E\80&", [3 x i8] c"\8E\81&", [3 x i8] c"\8E\82&", [3 x i8] c"\8E\82%", [3 x i8] c"\8E\83%", [3 x i8] c"\8E\84%", [3 x i8] c"\8E\85$", [3 x i8] c"\8E\86$", [3 x i8] c"\8E\87#", [3 x i8] c"\8E\88#", [3 x i8] c"\8E\89#", [3 x i8] c"\8D\8A\22", [3 x i8] c"\8D\8B\22", [3 x i8] c"\8D\8C\22", [3 x i8] c"\8D\8D!", [3 x i8] c"\8D\8E!", [3 x i8] c"\8D\8F!", [3 x i8] c"\8D\90 ", [3 x i8] c"\8C\91 ", [3 x i8] c"\8C\92 ", [3 x i8] c"\8C\93 ", [3 x i8] c"\8C\93\1F", [3 x i8] c"\8C\94\1F", [3 x i8] c"\8B\95\1F", [3 x i8] c"\8B\96\1F", [3 x i8] c"\8B\97\1F", [3 x i8] c"\8B\98\1E", [3 x i8] c"\8A\99\1E", [3 x i8] c"\8A\9A\1E", [3 x i8] c"\8A\9B\1E", [3 x i8] c"\89\9C\1E", [3 x i8] c"\89\9D\1E", [3 x i8] c"\89\9E\1E", [3 x i8] c"\88\9F\1E", [3 x i8] c"\88\A0\1E", [3 x i8] c"\88\A1\1F", [3 x i8] c"\87\A2\1F", [3 x i8] c"\87\A3\1F", [3 x i8] c"\86\A3\1F", [3 x i8] c"\86\A4 ", [3 x i8] c"\86\A5 ", [3 x i8] c"\85\A6!", [3 x i8] c"\85\A7!", [3 x i8] c"\84\A8\22", [3 x i8] c"\83\A9#", [3 x i8] c"\83\AA#", [3 x i8] c"\82\AB$", [3 x i8] c"\82\AC%", [3 x i8] c"\81\AD&", [3 x i8] c"\81\AE'", [3 x i8] c"\80\AF(", [3 x i8] c"\7F\AF)", [3 x i8] c"\7F\B0*", [3 x i8] c"~\B1+", [3 x i8] c"}\B2,", [3 x i8] c"|\B3.", [3 x i8] c"|\B4/", [3 x i8] c"{\B50", [3 x i8] c"z\B62", [3 x i8] c"y\B73", [3 x i8] c"y\B75", [3 x i8] c"x\B86", [3 x i8] c"w\B98", [3 x i8] c"v\BA9", [3 x i8] c"u\BB;", [3 x i8] c"t\BC=", [3 x i8] c"s\BD>", [3 x i8] c"r\BD@", [3 x i8] c"q\BEB", [3 x i8] c"p\BFD", [3 x i8] c"o\C0F", [3 x i8] c"n\C1H", [3 x i8] c"m\C2I", [3 x i8] c"l\C2K", [3 x i8] c"k\C3M", [3 x i8] c"j\C4O", [3 x i8] c"i\C5Q", [3 x i8] c"h\C6S", [3 x i8] c"f\C6U", [3 x i8] c"e\C7X", [3 x i8] c"d\C8Z", [3 x i8] c"c\C9\\", [3 x i8] c"b\C9^", [3 x i8] c"`\CA`", [3 x i8] c"_\CBb", [3 x i8] c"^\CCe", [3 x i8] c"\\\CCg", [3 x i8] c"[\CDi", [3 x i8] c"Z\CEl", [3 x i8] c"X\CEn", [3 x i8] c"W\CFp", [3 x i8] c"U\D0s", [3 x i8] c"T\D0u", [3 x i8] c"R\D1w", [3 x i8] c"Q\D2z", [3 x i8] c"O\D2|", [3 x i8] c"N\D3\7F", [3 x i8] c"L\D4\81", [3 x i8] c"K\D4\84", [3 x i8] c"I\D5\86", [3 x i8] c"H\D5\89", [3 x i8] c"F\D6\8B", [3 x i8] c"D\D7\8E", [3 x i8] c"C\D7\90", [3 x i8] c"A\D8\93", [3 x i8] c"?\D8\95", [3 x i8] c">\D9\98", [3 x i8] c"<\D9\9B", [3 x i8] c":\DA\9D", [3 x i8] c"9\DA\A0", [3 x i8] c"7\DB\A3", [3 x i8] c"5\DB\A5", [3 x i8] c"3\DC\A8", [3 x i8] c"2\DC\AB", [3 x i8] c"0\DD\AD", [3 x i8] c".\DD\B0", [3 x i8] c"-\DD\B3", [3 x i8] c"+\DE\B5", [3 x i8] c")\DE\B8", [3 x i8] c"'\DF\BB", [3 x i8] c"&\DF\BD", [3 x i8] c"$\DF\C0", [3 x i8] c"#\E0\C3", [3 x i8] c"!\E0\C5", [3 x i8] c" \E1\C8", [3 x i8] c"\1E\E1\CB", [3 x i8] c"\1D\E1\CD", [3 x i8] c"\1C\E2\D0", [3 x i8] c"\1B\E2\D3", [3 x i8] c"\1A\E2\D5", [3 x i8] c"\19\E3\D8", [3 x i8] c"\18\E3\DB", [3 x i8] c"\18\E3\DD", [3 x i8] c"\18\E4\E0", [3 x i8] c"\18\E4\E2", [3 x i8] c"\18\E4\E5", [3 x i8] c"\19\E5\E8", [3 x i8] c"\19\E5\EA", [3 x i8] c"\1A\E5\ED", [3 x i8] c"\1B\E6\EF", [3 x i8] c"\1C\E6\F2", [3 x i8] c"\1E\E6\F4", [3 x i8] c"\1F\E6\F7", [3 x i8] c"!\E7\F9", [3 x i8] c"#\E7\FB", [3 x i8] c"$\E7\FE"], align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @mandel_float(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float %5, float %6, float %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul i32 %11, %16
  %21 = add i32 %20, %10
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = add i32 %28, %22
  %30 = mul i32 %29, %16
  %31 = udiv i32 %19, %16
  %32 = mul i32 %31, %16
  %33 = icmp ugt i32 %19, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %30, %35
  %37 = add i32 %36, %21
  %38 = icmp slt i32 %21, %3
  %39 = icmp slt i32 %29, %4
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %116

41:                                               ; preds = %9
  %42 = shl nsw i32 %8, 8
  %43 = fdiv contract float 1.000000e+00, %7
  %44 = sitofp i32 %4 to float
  %45 = fmul contract float %43, %44
  %46 = sitofp i32 %3 to float
  %47 = fdiv contract float %45, %46
  %48 = icmp sgt i32 %4, %3
  br i1 %48, label %49, label %52

49:                                               ; preds = %41
  %50 = fmul contract float %43, %46
  %51 = fdiv contract float %50, %44
  br label %52

52:                                               ; preds = %49, %41
  %53 = phi float [ %43, %49 ], [ %47, %41 ]
  %54 = phi float [ %51, %49 ], [ %43, %41 ]
  %55 = fsub contract float %5, %54
  %56 = fsub contract float %6, %53
  %57 = fmul contract float %54, 2.000000e+00
  %58 = add nsw i32 %3, -1
  %59 = sitofp i32 %58 to float
  %60 = fdiv contract float %57, %59
  %61 = fmul contract float %53, 2.000000e+00
  %62 = add nsw i32 %4, -1
  %63 = sitofp i32 %62 to float
  %64 = fdiv contract float %61, %63
  %65 = sitofp i32 %21 to float
  %66 = fmul contract float %60, %65
  %67 = fadd contract float %55, %66
  %68 = sitofp i32 %29 to float
  %69 = fmul contract float %64, %68
  %70 = fadd contract float %56, %69
  %71 = icmp eq i32 %8, 0
  br i1 %71, label %107, label %72

72:                                               ; preds = %52, %98
  %73 = phi i8 [ %103, %98 ], [ 0, %52 ]
  %74 = phi i8 [ %102, %98 ], [ 0, %52 ]
  %75 = phi i8 [ %101, %98 ], [ 0, %52 ]
  %76 = phi i32 [ %104, %98 ], [ 0, %52 ]
  %77 = phi float [ %100, %98 ], [ %70, %52 ]
  %78 = phi float [ %99, %98 ], [ %67, %52 ]
  %79 = fmul contract float %78, %78
  %80 = fmul contract float %77, %77
  %81 = fadd contract float %79, %80
  %82 = fcmp contract ule float %81, 4.000000e+00
  br i1 %82, label %92, label %83

83:                                               ; preds = %72
  %84 = and i32 %76, 255
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [256 x [3 x i8]], [256 x [3 x i8]] addrspace(1)* @_ZL7viridis, i64 0, i64 %85, i64 0
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !16
  %88 = getelementptr inbounds [256 x [3 x i8]], [256 x [3 x i8]] addrspace(1)* @_ZL7viridis, i64 0, i64 %85, i64 1
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !16
  %90 = getelementptr inbounds [256 x [3 x i8]], [256 x [3 x i8]] addrspace(1)* @_ZL7viridis, i64 0, i64 %85, i64 2
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !16
  br label %98

92:                                               ; preds = %72
  %93 = fmul contract float %78, 2.000000e+00
  %94 = fmul contract float %93, %77
  %95 = fadd contract float %70, %94
  %96 = fsub contract float %79, %80
  %97 = fadd contract float %67, %96
  br label %98

98:                                               ; preds = %92, %83
  %99 = phi float [ %78, %83 ], [ %97, %92 ]
  %100 = phi float [ %77, %83 ], [ %95, %92 ]
  %101 = phi i8 [ %91, %83 ], [ %75, %92 ]
  %102 = phi i8 [ %89, %83 ], [ %74, %92 ]
  %103 = phi i8 [ %87, %83 ], [ %73, %92 ]
  %104 = add nuw i32 %76, 1
  %105 = icmp ult i32 %104, %42
  %106 = select i1 %82, i1 %105, i1 false
  br i1 %106, label %72, label %107, !llvm.loop !19

107:                                              ; preds = %98, %52
  %108 = phi i8 [ 0, %52 ], [ %101, %98 ]
  %109 = phi i8 [ 0, %52 ], [ %102, %98 ]
  %110 = phi i8 [ 0, %52 ], [ %103, %98 ]
  %111 = sext i32 %37 to i64
  %112 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %111, i32 0, i32 0, i32 0, i64 0
  store i8 %110, i8 addrspace(1)* %112, align 4
  %113 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %111, i32 0, i32 0, i32 0, i64 1
  store i8 %109, i8 addrspace(1)* %113, align 1
  %114 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %111, i32 0, i32 0, i32 0, i64 2
  store i8 %108, i8 addrspace(1)* %114, align 2
  %115 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %111, i32 0, i32 0, i32 0, i64 3
  store i8 0, i8 addrspace(1)* %115, align 1
  br label %123

116:                                              ; preds = %9
  %117 = icmp slt i32 %21, %1
  %118 = icmp slt i32 %29, %2
  %119 = select i1 %117, i1 %118, i1 false
  br i1 %119, label %120, label %123

120:                                              ; preds = %116
  %121 = sext i32 %37 to i64
  %122 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %121, i32 0, i32 0, i32 0
  store <4 x i8> <i8 0, i8 -1, i8 -1, i8 0>, <4 x i8> addrspace(1)* %122, align 4
  br label %123

123:                                              ; preds = %116, %120, %107
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
