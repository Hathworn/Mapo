; ModuleID = '../data/hip_kernels/831/16/main.cu'
source_filename = "../data/hip_kernels/831/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14KernelTilesMulPfS_S_iiiE3Mds = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ14KernelTilesMulPfS_S_iiiE3Nds = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14KernelTilesMulPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 4
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 4
  %14 = add nsw i32 %13, %9
  %15 = icmp sgt i32 %4, 0
  br i1 %15, label %16, label %56

16:                                               ; preds = %6
  %17 = add nuw nsw i32 %4, 15
  %18 = lshr i32 %17, 4
  %19 = icmp slt i32 %12, %3
  %20 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 %9
  %21 = mul nsw i32 %12, %4
  %22 = icmp slt i32 %14, %5
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 %10, i32 %9
  %24 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 0
  %25 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 0, i32 %9
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 1
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 1, i32 %9
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 2
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 2, i32 %9
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 3
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 3, i32 %9
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 4
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 4, i32 %9
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 5
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 5, i32 %9
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 6
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 6, i32 %9
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 7
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 7, i32 %9
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 8
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 8, i32 %9
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 9
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 9, i32 %9
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 10
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 10, i32 %9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 11
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 11, i32 %9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 12
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 12, i32 %9
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 13
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 13, i32 %9
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 14
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 14, i32 %9
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Mds, i32 0, i32 %10, i32 15
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14KernelTilesMulPfS_S_iiiE3Nds, i32 0, i32 15, i32 %9
  br label %61

56:                                               ; preds = %84, %6
  %57 = phi float [ 0.000000e+00, %6 ], [ %149, %84 ]
  %58 = icmp slt i32 %12, %3
  %59 = icmp slt i32 %14, %5
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %60, label %152, label %157

61:                                               ; preds = %16, %84
  %62 = phi i32 [ 0, %16 ], [ %150, %84 ]
  %63 = phi float [ 0.000000e+00, %16 ], [ %149, %84 ]
  %64 = shl nsw i32 %62, 4
  %65 = add nuw i32 %64, %9
  %66 = icmp slt i32 %65, %4
  %67 = select i1 %66, i1 %19, i1 false
  br i1 %67, label %68, label %73

68:                                               ; preds = %61
  %69 = add i32 %65, %21
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %73

73:                                               ; preds = %61, %68
  %74 = phi float [ %72, %68 ], [ 0.000000e+00, %61 ]
  store float %74, float addrspace(3)* %20, align 4, !tbaa !5
  %75 = add nuw nsw i32 %64, %10
  %76 = icmp slt i32 %75, %4
  %77 = select i1 %76, i1 %22, i1 false
  br i1 %77, label %78, label %84

78:                                               ; preds = %73
  %79 = mul nsw i32 %75, %5
  %80 = add nsw i32 %79, %14
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %84

84:                                               ; preds = %73, %78
  %85 = phi float [ %83, %78 ], [ 0.000000e+00, %73 ]
  store float %85, float addrspace(3)* %23, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %86 = load float, float addrspace(3)* %24, align 16, !tbaa !5
  %87 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %88 = fmul contract float %86, %87
  %89 = fadd contract float %63, %88
  %90 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %91 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %92 = fmul contract float %90, %91
  %93 = fadd contract float %89, %92
  %94 = load float, float addrspace(3)* %28, align 8, !tbaa !5
  %95 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %96 = fmul contract float %94, %95
  %97 = fadd contract float %93, %96
  %98 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %99 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %97, %100
  %102 = load float, float addrspace(3)* %32, align 16, !tbaa !5
  %103 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %101, %104
  %106 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %107 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %108 = fmul contract float %106, %107
  %109 = fadd contract float %105, %108
  %110 = load float, float addrspace(3)* %36, align 8, !tbaa !5
  %111 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %109, %112
  %114 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %115 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %113, %116
  %118 = load float, float addrspace(3)* %40, align 16, !tbaa !5
  %119 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %123 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %44, align 8, !tbaa !5
  %127 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %131 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %48, align 16, !tbaa !5
  %135 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %139 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %52, align 8, !tbaa !5
  %143 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %147 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = add nuw nsw i32 %62, 1
  %151 = icmp eq i32 %150, %18
  br i1 %151, label %56, label %61, !llvm.loop !10

152:                                              ; preds = %56
  %153 = mul nsw i32 %12, %5
  %154 = add nsw i32 %153, %14
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %2, i64 %155
  store float %57, float addrspace(1)* %156, align 4, !tbaa !5
  br label %157

157:                                              ; preds = %152, %56
  ret void
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
