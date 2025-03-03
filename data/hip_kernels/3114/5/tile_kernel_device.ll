; ModuleID = '../data/hip_kernels/3114/5/main.cu'
source_filename = "../data/hip_kernels/3114/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11tile_kernelPKfPfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = freeze i32 %14
  %16 = freeze i32 %3
  %17 = sdiv i32 %15, %16
  %18 = icmp slt i32 %17, %2
  %19 = icmp sgt i32 %4, 0
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %117

21:                                               ; preds = %5
  %22 = mul i32 %17, %16
  %23 = sub i32 %15, %22
  %24 = mul nsw i32 %17, %4
  %25 = mul i32 %17, %3
  %26 = add i32 %23, %25
  %27 = mul i32 %26, %4
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %4, 8
  br i1 %29, label %101, label %30

30:                                               ; preds = %21
  %31 = and i32 %4, -8
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi i32 [ 0, %30 ], [ %98, %32 ]
  %34 = phi i32 [ 0, %30 ], [ %99, %32 ]
  %35 = add nsw i32 %33, %24
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = add i32 %33, %27
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  store float %38, float addrspace(1)* %41, align 4, !tbaa !7
  %42 = or i32 %33, 1
  %43 = add nsw i32 %42, %24
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = add i32 %42, %27
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  store float %46, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = or i32 %33, 2
  %51 = add nsw i32 %50, %24
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = add i32 %50, %27
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  store float %54, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = or i32 %33, 3
  %59 = add nsw i32 %58, %24
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = add i32 %58, %27
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  store float %62, float addrspace(1)* %65, align 4, !tbaa !7
  %66 = or i32 %33, 4
  %67 = add nsw i32 %66, %24
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = add i32 %66, %27
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %70, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = or i32 %33, 5
  %75 = add nsw i32 %74, %24
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = add i32 %74, %27
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  store float %78, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = or i32 %33, 6
  %83 = add nsw i32 %82, %24
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = add i32 %82, %27
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  store float %86, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = or i32 %33, 7
  %91 = add nsw i32 %90, %24
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = add i32 %90, %27
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  store float %94, float addrspace(1)* %97, align 4, !tbaa !7
  %98 = add nuw nsw i32 %33, 8
  %99 = add i32 %34, 8
  %100 = icmp eq i32 %99, %31
  br i1 %100, label %101, label %32, !llvm.loop !11

101:                                              ; preds = %32, %21
  %102 = phi i32 [ 0, %21 ], [ %98, %32 ]
  %103 = icmp eq i32 %28, 0
  br i1 %103, label %117, label %104

104:                                              ; preds = %101, %104
  %105 = phi i32 [ %114, %104 ], [ %102, %101 ]
  %106 = phi i32 [ %115, %104 ], [ 0, %101 ]
  %107 = add nsw i32 %105, %24
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = add i32 %105, %27
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  store float %110, float addrspace(1)* %113, align 4, !tbaa !7
  %114 = add nuw nsw i32 %105, 1
  %115 = add i32 %106, 1
  %116 = icmp eq i32 %115, %28
  br i1 %116, label %117, label %104, !llvm.loop !13

117:                                              ; preds = %101, %104, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
