; ModuleID = '../data/hip_kernels/13960/8/main.cu'
source_filename = "../data/hip_kernels/13960/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17matrixMultiKernelPdS_S_iE5sub_a = internal unnamed_addr addrspace(3) global [16 x [16 x double]] undef, align 16
@_ZZ17matrixMultiKernelPdS_S_iE5sub_b = internal unnamed_addr addrspace(3) global [16 x [16 x double]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17matrixMultiKernelPdS_S_i(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readnone %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %3, 4
  %10 = mul nsw i32 %9, %6
  %11 = add nsw i32 %10, %3
  %12 = shl nsw i32 %5, 4
  %13 = icmp sgt i32 %3, 0
  %14 = mul nsw i32 %8, %3
  br i1 %13, label %15, label %51

15:                                               ; preds = %4
  %16 = add i32 %14, %7
  %17 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 %7
  %18 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 0
  %20 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 0, i32 %7
  %21 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 1
  %22 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 1, i32 %7
  %23 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 2
  %24 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 2, i32 %7
  %25 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 3
  %26 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 3, i32 %7
  %27 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 4
  %28 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 4, i32 %7
  %29 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 5
  %30 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 5, i32 %7
  %31 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 6
  %32 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 6, i32 %7
  %33 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 7
  %34 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 7, i32 %7
  %35 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 8
  %36 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 8, i32 %7
  %37 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 9
  %38 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 9, i32 %7
  %39 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 10
  %40 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 10, i32 %7
  %41 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 11
  %42 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 11, i32 %7
  %43 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 12
  %44 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 12, i32 %7
  %45 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 13
  %46 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 13, i32 %7
  %47 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 14
  %48 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 14, i32 %7
  %49 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_a, i32 0, i32 %8, i32 15
  %50 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]] addrspace(3)* @_ZZ17matrixMultiKernelPdS_S_iE5sub_b, i32 0, i32 15, i32 %7
  br label %58

51:                                               ; preds = %58, %4
  %52 = phi double [ 0.000000e+00, %4 ], [ %133, %58 ]
  %53 = add i32 %12, %7
  %54 = add i32 %53, %14
  %55 = add i32 %54, %10
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  store double %52, double addrspace(1)* %57, align 8, !tbaa !5
  ret void

58:                                               ; preds = %15, %58
  %59 = phi double [ 0.000000e+00, %15 ], [ %133, %58 ]
  %60 = phi i32 [ %12, %15 ], [ %135, %58 ]
  %61 = phi i32 [ %10, %15 ], [ %134, %58 ]
  %62 = add i32 %16, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !5, !amdgpu.noclobber !9
  store double %65, double addrspace(3)* %17, align 8, !tbaa !5
  %66 = add i32 %16, %60
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !5, !amdgpu.noclobber !9
  store double %69, double addrspace(3)* %18, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = load double, double addrspace(3)* %19, align 16, !tbaa !5
  %71 = load double, double addrspace(3)* %20, align 8, !tbaa !5
  %72 = fmul contract double %70, %71
  %73 = fadd contract double %59, %72
  %74 = load double, double addrspace(3)* %21, align 8, !tbaa !5
  %75 = load double, double addrspace(3)* %22, align 8, !tbaa !5
  %76 = fmul contract double %74, %75
  %77 = fadd contract double %73, %76
  %78 = load double, double addrspace(3)* %23, align 16, !tbaa !5
  %79 = load double, double addrspace(3)* %24, align 8, !tbaa !5
  %80 = fmul contract double %78, %79
  %81 = fadd contract double %77, %80
  %82 = load double, double addrspace(3)* %25, align 8, !tbaa !5
  %83 = load double, double addrspace(3)* %26, align 8, !tbaa !5
  %84 = fmul contract double %82, %83
  %85 = fadd contract double %81, %84
  %86 = load double, double addrspace(3)* %27, align 16, !tbaa !5
  %87 = load double, double addrspace(3)* %28, align 8, !tbaa !5
  %88 = fmul contract double %86, %87
  %89 = fadd contract double %85, %88
  %90 = load double, double addrspace(3)* %29, align 8, !tbaa !5
  %91 = load double, double addrspace(3)* %30, align 8, !tbaa !5
  %92 = fmul contract double %90, %91
  %93 = fadd contract double %89, %92
  %94 = load double, double addrspace(3)* %31, align 16, !tbaa !5
  %95 = load double, double addrspace(3)* %32, align 8, !tbaa !5
  %96 = fmul contract double %94, %95
  %97 = fadd contract double %93, %96
  %98 = load double, double addrspace(3)* %33, align 8, !tbaa !5
  %99 = load double, double addrspace(3)* %34, align 8, !tbaa !5
  %100 = fmul contract double %98, %99
  %101 = fadd contract double %97, %100
  %102 = load double, double addrspace(3)* %35, align 16, !tbaa !5
  %103 = load double, double addrspace(3)* %36, align 8, !tbaa !5
  %104 = fmul contract double %102, %103
  %105 = fadd contract double %101, %104
  %106 = load double, double addrspace(3)* %37, align 8, !tbaa !5
  %107 = load double, double addrspace(3)* %38, align 8, !tbaa !5
  %108 = fmul contract double %106, %107
  %109 = fadd contract double %105, %108
  %110 = load double, double addrspace(3)* %39, align 16, !tbaa !5
  %111 = load double, double addrspace(3)* %40, align 8, !tbaa !5
  %112 = fmul contract double %110, %111
  %113 = fadd contract double %109, %112
  %114 = load double, double addrspace(3)* %41, align 8, !tbaa !5
  %115 = load double, double addrspace(3)* %42, align 8, !tbaa !5
  %116 = fmul contract double %114, %115
  %117 = fadd contract double %113, %116
  %118 = load double, double addrspace(3)* %43, align 16, !tbaa !5
  %119 = load double, double addrspace(3)* %44, align 8, !tbaa !5
  %120 = fmul contract double %118, %119
  %121 = fadd contract double %117, %120
  %122 = load double, double addrspace(3)* %45, align 8, !tbaa !5
  %123 = load double, double addrspace(3)* %46, align 8, !tbaa !5
  %124 = fmul contract double %122, %123
  %125 = fadd contract double %121, %124
  %126 = load double, double addrspace(3)* %47, align 16, !tbaa !5
  %127 = load double, double addrspace(3)* %48, align 8, !tbaa !5
  %128 = fmul contract double %126, %127
  %129 = fadd contract double %125, %128
  %130 = load double, double addrspace(3)* %49, align 8, !tbaa !5
  %131 = load double, double addrspace(3)* %50, align 8, !tbaa !5
  %132 = fmul contract double %130, %131
  %133 = fadd contract double %129, %132
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %134 = add nsw i32 %61, 16
  %135 = add nsw i32 %60, %9
  %136 = icmp slt i32 %134, %11
  br i1 %136, label %58, label %51, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
