; ModuleID = '../data/hip_kernels/11774/28/main.cu'
source_filename = "../data/hip_kernels/11774/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16kSqSumColumnwisePfS_jjE8sum_vals = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16kSqSumColumnwisePfS_jj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp ult i32 %5, %3
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %3
  br label %82

10:                                               ; preds = %82, %4
  %11 = phi float [ 0.000000e+00, %4 ], [ %90, %82 ]
  %12 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 %5
  store float %11, float addrspace(3)* %12, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %14, label %93

14:                                               ; preds = %10
  %15 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 0), align 16, !tbaa !5
  %16 = fadd contract float %15, 0.000000e+00
  %17 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 1), align 4, !tbaa !5
  %18 = fadd contract float %16, %17
  %19 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 2), align 8, !tbaa !5
  %20 = fadd contract float %18, %19
  %21 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 3), align 4, !tbaa !5
  %22 = fadd contract float %20, %21
  %23 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 4), align 16, !tbaa !5
  %24 = fadd contract float %22, %23
  %25 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 5), align 4, !tbaa !5
  %26 = fadd contract float %24, %25
  %27 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 6), align 8, !tbaa !5
  %28 = fadd contract float %26, %27
  %29 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 7), align 4, !tbaa !5
  %30 = fadd contract float %28, %29
  %31 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 8), align 16, !tbaa !5
  %32 = fadd contract float %30, %31
  %33 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 9), align 4, !tbaa !5
  %34 = fadd contract float %32, %33
  %35 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 10), align 8, !tbaa !5
  %36 = fadd contract float %34, %35
  %37 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 11), align 4, !tbaa !5
  %38 = fadd contract float %36, %37
  %39 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 12), align 16, !tbaa !5
  %40 = fadd contract float %38, %39
  %41 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 13), align 4, !tbaa !5
  %42 = fadd contract float %40, %41
  %43 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 14), align 8, !tbaa !5
  %44 = fadd contract float %42, %43
  %45 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 15), align 4, !tbaa !5
  %46 = fadd contract float %44, %45
  %47 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 16), align 16, !tbaa !5
  %48 = fadd contract float %46, %47
  %49 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 17), align 4, !tbaa !5
  %50 = fadd contract float %48, %49
  %51 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 18), align 8, !tbaa !5
  %52 = fadd contract float %50, %51
  %53 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 19), align 4, !tbaa !5
  %54 = fadd contract float %52, %53
  %55 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 20), align 16, !tbaa !5
  %56 = fadd contract float %54, %55
  %57 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 21), align 4, !tbaa !5
  %58 = fadd contract float %56, %57
  %59 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 22), align 8, !tbaa !5
  %60 = fadd contract float %58, %59
  %61 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 23), align 4, !tbaa !5
  %62 = fadd contract float %60, %61
  %63 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 24), align 16, !tbaa !5
  %64 = fadd contract float %62, %63
  %65 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 25), align 4, !tbaa !5
  %66 = fadd contract float %64, %65
  %67 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 26), align 8, !tbaa !5
  %68 = fadd contract float %66, %67
  %69 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 27), align 4, !tbaa !5
  %70 = fadd contract float %68, %69
  %71 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 28), align 16, !tbaa !5
  %72 = fadd contract float %70, %71
  %73 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 29), align 4, !tbaa !5
  %74 = fadd contract float %72, %73
  %75 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 30), align 8, !tbaa !5
  %76 = fadd contract float %74, %75
  %77 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16kSqSumColumnwisePfS_jjE8sum_vals, i32 0, i32 31), align 4, !tbaa !5
  %78 = fadd contract float %76, %77
  %79 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  store float %78, float addrspace(1)* %81, align 4, !tbaa !5
  br label %93

82:                                               ; preds = %7, %82
  %83 = phi i32 [ %5, %7 ], [ %91, %82 ]
  %84 = phi float [ 0.000000e+00, %7 ], [ %90, %82 ]
  %85 = add i32 %83, %9
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = fmul contract float %88, %88
  %90 = fadd contract float %84, %89
  %91 = add i32 %83, 32
  %92 = icmp ult i32 %91, %3
  br i1 %92, label %82, label %10, !llvm.loop !10

93:                                               ; preds = %14, %10
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
