; ModuleID = '../data/hip_kernels/16858/3/main.cu'
source_filename = "../data/hip_kernels/16858/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17matrix_mul_matrixPfS_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %5
  %26 = icmp slt i32 %24, %6
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %167

28:                                               ; preds = %7
  %29 = icmp sgt i32 %3, 0
  br i1 %29, label %30, label %59

30:                                               ; preds = %28
  %31 = mul nsw i32 %16, %3
  %32 = and i32 %3, 7
  %33 = icmp ult i32 %3, 8
  br i1 %33, label %36, label %34

34:                                               ; preds = %30
  %35 = and i32 %3, -8
  br label %65

36:                                               ; preds = %65, %30
  %37 = phi float [ undef, %30 ], [ %163, %65 ]
  %38 = phi i32 [ 0, %30 ], [ %164, %65 ]
  %39 = phi float [ 0.000000e+00, %30 ], [ %163, %65 ]
  %40 = icmp eq i32 %32, 0
  br i1 %40, label %59, label %41

41:                                               ; preds = %36, %41
  %42 = phi i32 [ %56, %41 ], [ %38, %36 ]
  %43 = phi float [ %55, %41 ], [ %39, %36 ]
  %44 = phi i32 [ %57, %41 ], [ 0, %36 ]
  %45 = add nsw i32 %42, %31
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = mul nsw i32 %42, %4
  %50 = add nsw i32 %49, %24
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract float %48, %53
  %55 = fadd contract float %43, %54
  %56 = add nuw nsw i32 %42, 1
  %57 = add i32 %44, 1
  %58 = icmp eq i32 %57, %32
  br i1 %58, label %59, label %41, !llvm.loop !11

59:                                               ; preds = %36, %41, %28
  %60 = phi float [ 0.000000e+00, %28 ], [ %37, %36 ], [ %55, %41 ]
  %61 = mul nsw i32 %16, %4
  %62 = add nsw i32 %61, %24
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  store float %60, float addrspace(1)* %64, align 4, !tbaa !7
  br label %167

65:                                               ; preds = %65, %34
  %66 = phi i32 [ 0, %34 ], [ %164, %65 ]
  %67 = phi float [ 0.000000e+00, %34 ], [ %163, %65 ]
  %68 = phi i32 [ 0, %34 ], [ %165, %65 ]
  %69 = add nsw i32 %66, %31
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = mul nsw i32 %66, %4
  %74 = add nsw i32 %73, %24
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %72, %77
  %79 = fadd contract float %67, %78
  %80 = or i32 %66, 1
  %81 = add nsw i32 %80, %31
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = mul nsw i32 %80, %4
  %86 = add nsw i32 %85, %24
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fmul contract float %84, %89
  %91 = fadd contract float %79, %90
  %92 = or i32 %66, 2
  %93 = add nsw i32 %92, %31
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = mul nsw i32 %92, %4
  %98 = add nsw i32 %97, %24
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract float %96, %101
  %103 = fadd contract float %91, %102
  %104 = or i32 %66, 3
  %105 = add nsw i32 %104, %31
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = mul nsw i32 %104, %4
  %110 = add nsw i32 %109, %24
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = fmul contract float %108, %113
  %115 = fadd contract float %103, %114
  %116 = or i32 %66, 4
  %117 = add nsw i32 %116, %31
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = mul nsw i32 %116, %4
  %122 = add nsw i32 %121, %24
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract float %120, %125
  %127 = fadd contract float %115, %126
  %128 = or i32 %66, 5
  %129 = add nsw i32 %128, %31
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = mul nsw i32 %128, %4
  %134 = add nsw i32 %133, %24
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %132, %137
  %139 = fadd contract float %127, %138
  %140 = or i32 %66, 6
  %141 = add nsw i32 %140, %31
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = mul nsw i32 %140, %4
  %146 = add nsw i32 %145, %24
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !5
  %150 = fmul contract float %144, %149
  %151 = fadd contract float %139, %150
  %152 = or i32 %66, 7
  %153 = add nsw i32 %152, %31
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !5
  %157 = mul nsw i32 %152, %4
  %158 = add nsw i32 %157, %24
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !5
  %162 = fmul contract float %156, %161
  %163 = fadd contract float %151, %162
  %164 = add nuw nsw i32 %66, 8
  %165 = add i32 %68, 8
  %166 = icmp eq i32 %165, %35
  br i1 %166, label %36, label %65, !llvm.loop !13

167:                                              ; preds = %59, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
