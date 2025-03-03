; ModuleID = '../data/hip_kernels/7626/3/main.cu'
source_filename = "../data/hip_kernels/7626/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13fc_gpu_kernelPfS_S_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %5
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  %27 = icmp sgt i32 %3, 0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %164

29:                                               ; preds = %6
  %30 = mul nsw i32 %15, %3
  %31 = mul nsw i32 %15, %4
  %32 = add nsw i32 %31, %23
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = and i32 %3, 7
  %37 = icmp ult i32 %3, 8
  br i1 %37, label %142, label %38

38:                                               ; preds = %29
  %39 = and i32 %3, -8
  br label %40

40:                                               ; preds = %40, %38
  %41 = phi float [ %35, %38 ], [ %138, %40 ]
  %42 = phi i32 [ 0, %38 ], [ %139, %40 ]
  %43 = phi i32 [ 0, %38 ], [ %140, %40 ]
  %44 = add nsw i32 %42, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = mul nsw i32 %42, %4
  %49 = add nsw i32 %48, %23
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fmul contract float %47, %52
  %54 = fadd contract float %41, %53
  store float %54, float addrspace(1)* %34, align 4, !tbaa !7
  %55 = or i32 %42, 1
  %56 = add nsw i32 %55, %30
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = mul nsw i32 %55, %4
  %61 = add nsw i32 %60, %23
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fmul contract float %59, %64
  %66 = fadd contract float %54, %65
  store float %66, float addrspace(1)* %34, align 4, !tbaa !7
  %67 = or i32 %42, 2
  %68 = add nsw i32 %67, %30
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = mul nsw i32 %67, %4
  %73 = add nsw i32 %72, %23
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fmul contract float %71, %76
  %78 = fadd contract float %66, %77
  store float %78, float addrspace(1)* %34, align 4, !tbaa !7
  %79 = or i32 %42, 3
  %80 = add nsw i32 %79, %30
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = mul nsw i32 %79, %4
  %85 = add nsw i32 %84, %23
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fmul contract float %83, %88
  %90 = fadd contract float %78, %89
  store float %90, float addrspace(1)* %34, align 4, !tbaa !7
  %91 = or i32 %42, 4
  %92 = add nsw i32 %91, %30
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = mul nsw i32 %91, %4
  %97 = add nsw i32 %96, %23
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fmul contract float %95, %100
  %102 = fadd contract float %90, %101
  store float %102, float addrspace(1)* %34, align 4, !tbaa !7
  %103 = or i32 %42, 5
  %104 = add nsw i32 %103, %30
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = mul nsw i32 %103, %4
  %109 = add nsw i32 %108, %23
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fmul contract float %107, %112
  %114 = fadd contract float %102, %113
  store float %114, float addrspace(1)* %34, align 4, !tbaa !7
  %115 = or i32 %42, 6
  %116 = add nsw i32 %115, %30
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = mul nsw i32 %115, %4
  %121 = add nsw i32 %120, %23
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %2, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = fmul contract float %119, %124
  %126 = fadd contract float %114, %125
  store float %126, float addrspace(1)* %34, align 4, !tbaa !7
  %127 = or i32 %42, 7
  %128 = add nsw i32 %127, %30
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = mul nsw i32 %127, %4
  %133 = add nsw i32 %132, %23
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fmul contract float %131, %136
  %138 = fadd contract float %126, %137
  store float %138, float addrspace(1)* %34, align 4, !tbaa !7
  %139 = add nuw nsw i32 %42, 8
  %140 = add i32 %43, 8
  %141 = icmp eq i32 %140, %39
  br i1 %141, label %142, label %40, !llvm.loop !11

142:                                              ; preds = %40, %29
  %143 = phi float [ %35, %29 ], [ %138, %40 ]
  %144 = phi i32 [ 0, %29 ], [ %139, %40 ]
  %145 = icmp eq i32 %36, 0
  br i1 %145, label %164, label %146

146:                                              ; preds = %142, %146
  %147 = phi float [ %160, %146 ], [ %143, %142 ]
  %148 = phi i32 [ %161, %146 ], [ %144, %142 ]
  %149 = phi i32 [ %162, %146 ], [ 0, %142 ]
  %150 = add nsw i32 %148, %30
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %154 = mul nsw i32 %148, %4
  %155 = add nsw i32 %154, %23
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = fmul contract float %153, %158
  %160 = fadd contract float %147, %159
  store float %160, float addrspace(1)* %34, align 4, !tbaa !7
  %161 = add nuw nsw i32 %148, 1
  %162 = add i32 %149, 1
  %163 = icmp eq i32 %162, %36
  br i1 %163, label %164, label %146, !llvm.loop !13

164:                                              ; preds = %142, %146, %6
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
