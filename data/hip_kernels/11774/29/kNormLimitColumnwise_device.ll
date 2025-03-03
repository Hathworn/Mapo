; ModuleID = '../data/hip_kernels/11774/29/main.cu'
source_filename = "../data/hip_kernels/11774/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals = internal unnamed_addr addrspace(3) global [33 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20kNormLimitColumnwisePfS_fjj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp ult i32 %6, %4
  br i1 %7, label %8, label %11

8:                                                ; preds = %5
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %4
  br label %83

11:                                               ; preds = %83, %5
  %12 = phi float [ 0.000000e+00, %5 ], [ %91, %83 ]
  %13 = getelementptr inbounds [33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 %6
  store float %12, float addrspace(3)* %13, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %14 = icmp eq i32 %6, 0
  br i1 %14, label %17, label %15

15:                                               ; preds = %11
  %16 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 32), align 16, !tbaa !5
  br label %119

17:                                               ; preds = %11
  %18 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 0), align 16, !tbaa !5
  %19 = fadd contract float %18, 0.000000e+00
  %20 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 1), align 4, !tbaa !5
  %21 = fadd contract float %19, %20
  %22 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 2), align 8, !tbaa !5
  %23 = fadd contract float %21, %22
  %24 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 3), align 4, !tbaa !5
  %25 = fadd contract float %23, %24
  %26 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 4), align 16, !tbaa !5
  %27 = fadd contract float %25, %26
  %28 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 5), align 4, !tbaa !5
  %29 = fadd contract float %27, %28
  %30 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 6), align 8, !tbaa !5
  %31 = fadd contract float %29, %30
  %32 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 7), align 4, !tbaa !5
  %33 = fadd contract float %31, %32
  %34 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 8), align 16, !tbaa !5
  %35 = fadd contract float %33, %34
  %36 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 9), align 4, !tbaa !5
  %37 = fadd contract float %35, %36
  %38 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 10), align 8, !tbaa !5
  %39 = fadd contract float %37, %38
  %40 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 11), align 4, !tbaa !5
  %41 = fadd contract float %39, %40
  %42 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 12), align 16, !tbaa !5
  %43 = fadd contract float %41, %42
  %44 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 13), align 4, !tbaa !5
  %45 = fadd contract float %43, %44
  %46 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 14), align 8, !tbaa !5
  %47 = fadd contract float %45, %46
  %48 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 15), align 4, !tbaa !5
  %49 = fadd contract float %47, %48
  %50 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 16), align 16, !tbaa !5
  %51 = fadd contract float %49, %50
  %52 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 17), align 4, !tbaa !5
  %53 = fadd contract float %51, %52
  %54 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 18), align 8, !tbaa !5
  %55 = fadd contract float %53, %54
  %56 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 19), align 4, !tbaa !5
  %57 = fadd contract float %55, %56
  %58 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 20), align 16, !tbaa !5
  %59 = fadd contract float %57, %58
  %60 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 21), align 4, !tbaa !5
  %61 = fadd contract float %59, %60
  %62 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 22), align 8, !tbaa !5
  %63 = fadd contract float %61, %62
  %64 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 23), align 4, !tbaa !5
  %65 = fadd contract float %63, %64
  %66 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 24), align 16, !tbaa !5
  %67 = fadd contract float %65, %66
  %68 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 25), align 4, !tbaa !5
  %69 = fadd contract float %67, %68
  %70 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 26), align 8, !tbaa !5
  %71 = fadd contract float %69, %70
  %72 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 27), align 4, !tbaa !5
  %73 = fadd contract float %71, %72
  %74 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 28), align 16, !tbaa !5
  %75 = fadd contract float %73, %74
  %76 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 29), align 4, !tbaa !5
  %77 = fadd contract float %75, %76
  %78 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 30), align 8, !tbaa !5
  %79 = fadd contract float %77, %78
  %80 = load float, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 31), align 4, !tbaa !5
  %81 = fadd contract float %79, %80
  %82 = fcmp contract olt float %81, %2
  br i1 %82, label %117, label %94

83:                                               ; preds = %8, %83
  %84 = phi float [ 0.000000e+00, %8 ], [ %91, %83 ]
  %85 = phi i32 [ %6, %8 ], [ %92, %83 ]
  %86 = add i32 %85, %10
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = fmul contract float %89, %89
  %91 = fadd contract float %84, %90
  %92 = add i32 %85, 32
  %93 = icmp ult i32 %92, %4
  br i1 %93, label %83, label %11, !llvm.loop !10

94:                                               ; preds = %17
  %95 = fcmp olt float %81, 0x39F0000000000000
  %96 = select i1 %95, float 0x41F0000000000000, float 1.000000e+00
  %97 = fmul float %81, %96
  %98 = tail call float @llvm.sqrt.f32(float %97)
  %99 = bitcast float %98 to i32
  %100 = add nsw i32 %99, -1
  %101 = bitcast i32 %100 to float
  %102 = add nsw i32 %99, 1
  %103 = bitcast i32 %102 to float
  %104 = tail call i1 @llvm.amdgcn.class.f32(float %97, i32 608)
  %105 = select i1 %95, float 0x3EF0000000000000, float 1.000000e+00
  %106 = fneg float %103
  %107 = tail call float @llvm.fma.f32(float %106, float %98, float %97)
  %108 = fcmp ogt float %107, 0.000000e+00
  %109 = fneg float %101
  %110 = tail call float @llvm.fma.f32(float %109, float %98, float %97)
  %111 = fcmp ole float %110, 0.000000e+00
  %112 = select i1 %111, float %101, float %98
  %113 = select i1 %108, float %103, float %112
  %114 = fmul float %105, %113
  %115 = select i1 %104, float %97, float %114
  %116 = fdiv contract float %2, %115
  br label %117

117:                                              ; preds = %17, %94
  %118 = phi contract float [ %116, %94 ], [ 1.000000e+00, %17 ]
  store float %118, float addrspace(3)* getelementptr inbounds ([33 x float], [33 x float] addrspace(3)* @_ZZ20kNormLimitColumnwisePfS_fjjE8sum_vals, i32 0, i32 32), align 16, !tbaa !5
  br label %119

119:                                              ; preds = %15, %117
  %120 = phi float [ %16, %15 ], [ %118, %117 ]
  br i1 %7, label %121, label %124

121:                                              ; preds = %119
  %122 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %123 = mul i32 %122, %4
  br label %125

124:                                              ; preds = %125, %119
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

125:                                              ; preds = %121, %125
  %126 = phi i32 [ %6, %121 ], [ %133, %125 ]
  %127 = add i32 %126, %123
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5
  %131 = fmul contract float %120, %130
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  store float %131, float addrspace(1)* %132, align 4, !tbaa !5
  %133 = add i32 %126, 32
  %134 = icmp ult i32 %133, %4
  br i1 %134, label %125, label %124, !llvm.loop !12
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
