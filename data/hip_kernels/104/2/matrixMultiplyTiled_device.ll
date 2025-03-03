; ModuleID = '../data/hip_kernels/104/2/main.cu'
source_filename = "../data/hip_kernels/104/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19matrixMultiplyTiledPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = shl i32 %12, 4
  %14 = add i32 %13, %10
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = shl i32 %15, 4
  %17 = add i32 %16, %11
  %18 = icmp slt i32 %4, -14
  br i1 %18, label %59, label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %4, -1
  %21 = sdiv i32 %20, 16
  %22 = icmp ult i32 %17, %3
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 %10
  %24 = mul i32 %17, %4
  %25 = icmp ult i32 %14, %6
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 %11, i32 %10
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 0
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 0, i32 %10
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 1
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 1, i32 %10
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 2
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 2, i32 %10
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 3
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 3, i32 %10
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 4
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 4, i32 %10
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 5
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 5, i32 %10
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 6
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 6, i32 %10
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 7
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 7, i32 %10
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 8
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 8, i32 %10
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 9, i32 %10
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 10
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 10, i32 %10
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 11
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 11, i32 %10
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 12
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 12, i32 %10
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 13
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 13, i32 %10
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 14
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 14, i32 %10
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_A, i32 0, i32 %11, i32 15
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ19matrixMultiplyTiledPfS_S_iiiiiiE4ds_B, i32 0, i32 15, i32 %10
  br label %64

59:                                               ; preds = %87, %9
  %60 = phi float [ 0.000000e+00, %9 ], [ %152, %87 ]
  %61 = icmp ult i32 %17, %7
  %62 = icmp ult i32 %14, %8
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %155, label %160

64:                                               ; preds = %19, %87
  %65 = phi float [ 0.000000e+00, %19 ], [ %152, %87 ]
  %66 = phi i32 [ 0, %19 ], [ %153, %87 ]
  %67 = shl nsw i32 %66, 4
  %68 = add nuw i32 %67, %10
  %69 = add nuw i32 %67, %11
  %70 = icmp ult i32 %68, %4
  %71 = select i1 %22, i1 %70, i1 false
  br i1 %71, label %72, label %77

72:                                               ; preds = %64
  %73 = add i32 %68, %24
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %77

77:                                               ; preds = %64, %72
  %78 = phi float [ %76, %72 ], [ 0.000000e+00, %64 ]
  store float %78, float addrspace(3)* %23, align 4, !tbaa !5
  %79 = icmp ult i32 %69, %5
  %80 = select i1 %25, i1 %79, i1 false
  br i1 %80, label %81, label %87

81:                                               ; preds = %77
  %82 = mul i32 %69, %6
  %83 = add i32 %82, %14
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %87

87:                                               ; preds = %77, %81
  %88 = phi float [ %86, %81 ], [ 0.000000e+00, %77 ]
  store float %88, float addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = load float, float addrspace(3)* %27, align 16, !tbaa !5
  %90 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %91 = fmul contract float %89, %90
  %92 = fadd contract float %65, %91
  %93 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %94 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %92, %95
  %97 = load float, float addrspace(3)* %31, align 8, !tbaa !5
  %98 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %96, %99
  %101 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %102 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %100, %103
  %105 = load float, float addrspace(3)* %35, align 16, !tbaa !5
  %106 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %104, %107
  %109 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %110 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %108, %111
  %113 = load float, float addrspace(3)* %39, align 8, !tbaa !5
  %114 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %112, %115
  %117 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %118 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %116, %119
  %121 = load float, float addrspace(3)* %43, align 16, !tbaa !5
  %122 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %126 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %130 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %134 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  %137 = load float, float addrspace(3)* %51, align 16, !tbaa !5
  %138 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %136, %139
  %141 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %142 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %143 = fmul contract float %141, %142
  %144 = fadd contract float %140, %143
  %145 = load float, float addrspace(3)* %55, align 8, !tbaa !5
  %146 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %147 = fmul contract float %145, %146
  %148 = fadd contract float %144, %147
  %149 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %150 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %151 = fmul contract float %149, %150
  %152 = fadd contract float %148, %151
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %153 = add nuw nsw i32 %66, 1
  %154 = icmp eq i32 %66, %21
  br i1 %154, label %59, label %64, !llvm.loop !10

155:                                              ; preds = %59
  %156 = mul i32 %17, %8
  %157 = add i32 %156, %14
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %2, i64 %158
  store float %60, float addrspace(1)* %159, align 4, !tbaa !5
  br label %160

160:                                              ; preds = %155, %59
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
