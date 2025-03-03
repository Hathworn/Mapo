; ModuleID = '../data/hip_kernels/2824/22/main.cu'
source_filename = "../data/hip_kernels/2824/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@const_stencilWeight = protected addrspace(4) externally_initialized global [10000 x float] zeroinitializer, align 16
@_ZZ14stencilShared2PfS_iE6buffer = internal unnamed_addr addrspace(3) global [1045 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([10000 x float] addrspace(4)* @const_stencilWeight to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14stencilShared2PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  br label %16

13:                                               ; preds = %16
  %14 = add nsw i32 %12, 11
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %25, label %147

16:                                               ; preds = %3, %16
  %17 = phi i32 [ %11, %3 ], [ %23, %16 ]
  %18 = add nsw i32 %17, %12
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %17
  store float %21, float addrspace(3)* %22, align 4, !tbaa !7
  %23 = add nuw nsw i32 %17, 1024
  %24 = icmp ult i32 %17, 21
  br i1 %24, label %16, label %13, !llvm.loop !11

25:                                               ; preds = %13
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %11
  %27 = load float, float addrspace(3)* %26, align 4, !tbaa !7
  %28 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 0), align 16, !tbaa !7
  %29 = fmul contract float %27, %28
  %30 = fadd contract float %29, 0.000000e+00
  %31 = add nuw nsw i32 %11, 1
  %32 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %31
  %33 = load float, float addrspace(3)* %32, align 4, !tbaa !7
  %34 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 1), align 4, !tbaa !7
  %35 = fmul contract float %33, %34
  %36 = fadd contract float %30, %35
  %37 = add nuw nsw i32 %11, 2
  %38 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %37
  %39 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %40 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 2), align 8, !tbaa !7
  %41 = fmul contract float %39, %40
  %42 = fadd contract float %36, %41
  %43 = add nuw nsw i32 %11, 3
  %44 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %46 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 3), align 4, !tbaa !7
  %47 = fmul contract float %45, %46
  %48 = fadd contract float %42, %47
  %49 = add nuw nsw i32 %11, 4
  %50 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %49
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %52 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 4), align 16, !tbaa !7
  %53 = fmul contract float %51, %52
  %54 = fadd contract float %48, %53
  %55 = add nuw nsw i32 %11, 5
  %56 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %55
  %57 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %58 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 5), align 4, !tbaa !7
  %59 = fmul contract float %57, %58
  %60 = fadd contract float %54, %59
  %61 = add nuw nsw i32 %11, 6
  %62 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %64 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 6), align 8, !tbaa !7
  %65 = fmul contract float %63, %64
  %66 = fadd contract float %60, %65
  %67 = add nuw nsw i32 %11, 7
  %68 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %67
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %70 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 7), align 4, !tbaa !7
  %71 = fmul contract float %69, %70
  %72 = fadd contract float %66, %71
  %73 = add nuw nsw i32 %11, 8
  %74 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %76 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 8), align 16, !tbaa !7
  %77 = fmul contract float %75, %76
  %78 = fadd contract float %72, %77
  %79 = add nuw nsw i32 %11, 9
  %80 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %79
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %82 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 9), align 4, !tbaa !7
  %83 = fmul contract float %81, %82
  %84 = fadd contract float %78, %83
  %85 = add nuw nsw i32 %11, 10
  %86 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %88 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 10), align 8, !tbaa !7
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %84, %89
  %91 = add nuw nsw i32 %11, 11
  %92 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %91
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !7
  %94 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 11), align 4, !tbaa !7
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %90, %95
  %97 = add nuw nsw i32 %11, 12
  %98 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %100 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 12), align 16, !tbaa !7
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %96, %101
  %103 = add nuw nsw i32 %11, 13
  %104 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %103
  %105 = load float, float addrspace(3)* %104, align 4, !tbaa !7
  %106 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 13), align 4, !tbaa !7
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %102, %107
  %109 = add nuw nsw i32 %11, 14
  %110 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %109
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 14), align 8, !tbaa !7
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %108, %113
  %115 = add nuw nsw i32 %11, 15
  %116 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %115
  %117 = load float, float addrspace(3)* %116, align 4, !tbaa !7
  %118 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 15), align 4, !tbaa !7
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %114, %119
  %121 = add nuw nsw i32 %11, 16
  %122 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %121
  %123 = load float, float addrspace(3)* %122, align 4, !tbaa !7
  %124 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 16), align 16, !tbaa !7
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %120, %125
  %127 = add nuw nsw i32 %11, 17
  %128 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %127
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !7
  %130 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 17), align 4, !tbaa !7
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %126, %131
  %133 = add nuw nsw i32 %11, 18
  %134 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !7
  %136 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 18), align 8, !tbaa !7
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %132, %137
  %139 = add nuw nsw i32 %11, 19
  %140 = getelementptr inbounds [1045 x float], [1045 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iE6buffer, i32 0, i32 %139
  %141 = load float, float addrspace(3)* %140, align 4, !tbaa !7
  %142 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 19), align 4, !tbaa !7
  %143 = fmul contract float %141, %142
  %144 = fadd contract float %138, %143
  %145 = sext i32 %14 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  store float %144, float addrspace(1)* %146, align 4, !tbaa !7
  br label %147

147:                                              ; preds = %13, %25
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
