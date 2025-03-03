; ModuleID = '../data/hip_kernels/8919/2/main.cu'
source_filename = "../data/hip_kernels/8919/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13matrixMulCUDAPfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = icmp slt i32 %5, %3
  %8 = icmp slt i32 %6, %3
  %9 = select i1 %7, i1 %8, i1 false
  br i1 %9, label %10, label %147

10:                                               ; preds = %4
  %11 = mul nsw i32 %5, %3
  %12 = add i32 %3, -1
  %13 = and i32 %3, 7
  %14 = icmp ult i32 %12, 7
  br i1 %14, label %119, label %15

15:                                               ; preds = %10
  %16 = and i32 %3, -8
  br label %17

17:                                               ; preds = %17, %15
  %18 = phi float [ 0.000000e+00, %15 ], [ %115, %17 ]
  %19 = phi i32 [ 0, %15 ], [ %116, %17 ]
  %20 = phi i32 [ 0, %15 ], [ %117, %17 ]
  %21 = add nsw i32 %19, %11
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = mul nsw i32 %19, %3
  %26 = add nsw i32 %25, %6
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = fmul contract float %24, %29
  %31 = fadd contract float %18, %30
  %32 = or i32 %19, 1
  %33 = add nsw i32 %32, %11
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = mul nsw i32 %32, %3
  %38 = add nsw i32 %37, %6
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = fmul contract float %36, %41
  %43 = fadd contract float %31, %42
  %44 = or i32 %19, 2
  %45 = add nsw i32 %44, %11
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = mul nsw i32 %44, %3
  %50 = add nsw i32 %49, %6
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = fmul contract float %48, %53
  %55 = fadd contract float %43, %54
  %56 = or i32 %19, 3
  %57 = add nsw i32 %56, %11
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = mul nsw i32 %56, %3
  %62 = add nsw i32 %61, %6
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = fmul contract float %60, %65
  %67 = fadd contract float %55, %66
  %68 = or i32 %19, 4
  %69 = add nsw i32 %68, %11
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = mul nsw i32 %68, %3
  %74 = add nsw i32 %73, %6
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = fmul contract float %72, %77
  %79 = fadd contract float %67, %78
  %80 = or i32 %19, 5
  %81 = add nsw i32 %80, %11
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = mul nsw i32 %80, %3
  %86 = add nsw i32 %85, %6
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = fmul contract float %84, %89
  %91 = fadd contract float %79, %90
  %92 = or i32 %19, 6
  %93 = add nsw i32 %92, %11
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = mul nsw i32 %92, %3
  %98 = add nsw i32 %97, %6
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = fmul contract float %96, %101
  %103 = fadd contract float %91, %102
  %104 = or i32 %19, 7
  %105 = add nsw i32 %104, %11
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = mul nsw i32 %104, %3
  %110 = add nsw i32 %109, %6
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %2, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  %114 = fmul contract float %108, %113
  %115 = fadd contract float %103, %114
  %116 = add nuw nsw i32 %19, 8
  %117 = add i32 %20, 8
  %118 = icmp eq i32 %117, %16
  br i1 %118, label %119, label %17, !llvm.loop !10

119:                                              ; preds = %17, %10
  %120 = phi float [ undef, %10 ], [ %115, %17 ]
  %121 = phi float [ 0.000000e+00, %10 ], [ %115, %17 ]
  %122 = phi i32 [ 0, %10 ], [ %116, %17 ]
  %123 = icmp eq i32 %13, 0
  br i1 %123, label %142, label %124

124:                                              ; preds = %119, %124
  %125 = phi float [ %138, %124 ], [ %121, %119 ]
  %126 = phi i32 [ %139, %124 ], [ %122, %119 ]
  %127 = phi i32 [ %140, %124 ], [ 0, %119 ]
  %128 = add nsw i32 %126, %11
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = mul nsw i32 %126, %3
  %133 = add nsw i32 %132, %6
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fmul contract float %131, %136
  %138 = fadd contract float %125, %137
  %139 = add nuw nsw i32 %126, 1
  %140 = add i32 %127, 1
  %141 = icmp eq i32 %140, %13
  br i1 %141, label %142, label %124, !llvm.loop !12

142:                                              ; preds = %124, %119
  %143 = phi float [ %120, %119 ], [ %138, %124 ]
  %144 = add nsw i32 %11, %6
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  store float %143, float addrspace(1)* %146, align 4, !tbaa !5
  br label %147

147:                                              ; preds = %4, %142
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
