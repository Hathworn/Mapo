; ModuleID = '../data/hip_kernels/10483/3/main.cu'
source_filename = "../data/hip_kernels/10483/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31matrixMultiplicationKernelNaivePKfS0_Pfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %6
  %27 = select i1 %25, i1 %26, i1 false
  %28 = icmp sgt i32 %4, 0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %161

30:                                               ; preds = %7
  %31 = mul nsw i32 %16, %4
  %32 = and i32 %4, 7
  %33 = icmp ult i32 %4, 8
  br i1 %33, label %138, label %34

34:                                               ; preds = %30
  %35 = and i32 %4, -8
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %135, %36 ]
  %38 = phi float [ 0.000000e+00, %34 ], [ %134, %36 ]
  %39 = phi i32 [ 0, %34 ], [ %136, %36 ]
  %40 = add nsw i32 %37, %31
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul nsw i32 %37, %4
  %45 = add nsw i32 %44, %24
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fmul contract float %43, %48
  %50 = fadd contract float %38, %49
  %51 = or i32 %37, 1
  %52 = add nsw i32 %51, %31
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = mul nsw i32 %51, %4
  %57 = add nsw i32 %56, %24
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %55, %60
  %62 = fadd contract float %50, %61
  %63 = or i32 %37, 2
  %64 = add nsw i32 %63, %31
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = mul nsw i32 %63, %4
  %69 = add nsw i32 %68, %24
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fmul contract float %67, %72
  %74 = fadd contract float %62, %73
  %75 = or i32 %37, 3
  %76 = add nsw i32 %75, %31
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = mul nsw i32 %75, %4
  %81 = add nsw i32 %80, %24
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fmul contract float %79, %84
  %86 = fadd contract float %74, %85
  %87 = or i32 %37, 4
  %88 = add nsw i32 %87, %31
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = mul nsw i32 %87, %4
  %93 = add nsw i32 %92, %24
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %86, %97
  %99 = or i32 %37, 5
  %100 = add nsw i32 %99, %31
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = mul nsw i32 %99, %4
  %105 = add nsw i32 %104, %24
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = fmul contract float %103, %108
  %110 = fadd contract float %98, %109
  %111 = or i32 %37, 6
  %112 = add nsw i32 %111, %31
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = mul nsw i32 %111, %4
  %117 = add nsw i32 %116, %24
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = fmul contract float %115, %120
  %122 = fadd contract float %110, %121
  %123 = or i32 %37, 7
  %124 = add nsw i32 %123, %31
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = mul nsw i32 %123, %4
  %129 = add nsw i32 %128, %24
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fmul contract float %127, %132
  %134 = fadd contract float %122, %133
  %135 = add nuw nsw i32 %37, 8
  %136 = add i32 %39, 8
  %137 = icmp eq i32 %136, %35
  br i1 %137, label %138, label %36, !llvm.loop !11

138:                                              ; preds = %36, %30
  %139 = phi float [ undef, %30 ], [ %134, %36 ]
  %140 = phi i32 [ 0, %30 ], [ %135, %36 ]
  %141 = phi float [ 0.000000e+00, %30 ], [ %134, %36 ]
  %142 = icmp eq i32 %32, 0
  br i1 %142, label %161, label %143

143:                                              ; preds = %138, %143
  %144 = phi i32 [ %158, %143 ], [ %140, %138 ]
  %145 = phi float [ %157, %143 ], [ %141, %138 ]
  %146 = phi i32 [ %159, %143 ], [ 0, %138 ]
  %147 = add nsw i32 %144, %31
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = mul nsw i32 %144, %4
  %152 = add nsw i32 %151, %24
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = fmul contract float %150, %155
  %157 = fadd contract float %145, %156
  %158 = add nuw nsw i32 %144, 1
  %159 = add i32 %146, 1
  %160 = icmp eq i32 %159, %32
  br i1 %160, label %161, label %143, !llvm.loop !13

161:                                              ; preds = %138, %143, %7
  %162 = phi float [ 0.000000e+00, %7 ], [ %139, %138 ], [ %157, %143 ]
  %163 = mul nsw i32 %16, %3
  %164 = add nsw i32 %163, %24
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  store float %162, float addrspace(1)* %166, align 4, !tbaa !7
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
