; ModuleID = '../data/hip_kernels/5766/6/main.cu'
source_filename = "../data/hip_kernels/5766/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22ComputeAdjacencyMatrixPfPiii(float addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp ult i32 %13, %2
  br i1 %14, label %15, label %137

15:                                               ; preds = %4
  %16 = mul i32 %13, %2
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = icmp sgt i32 %3, 0
  br i1 %19, label %20, label %137

20:                                               ; preds = %15
  %21 = and i32 %3, 7
  %22 = icmp ult i32 %3, 8
  br i1 %22, label %118, label %23

23:                                               ; preds = %20
  %24 = and i32 %3, -8
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i32 [ 0, %23 ], [ %115, %25 ]
  %27 = phi i32 [ 0, %23 ], [ %116, %25 ]
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = mul nsw i32 %30, %2
  %32 = add i32 %31, %13
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  store float 1.000000e+00, float addrspace(1)* %34, align 4, !tbaa !11
  %35 = add i32 %30, %16
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  store float 1.000000e+00, float addrspace(1)* %37, align 4, !tbaa !11
  %38 = or i32 %26, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = mul nsw i32 %41, %2
  %43 = add i32 %42, %13
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  store float 1.000000e+00, float addrspace(1)* %45, align 4, !tbaa !11
  %46 = add i32 %41, %16
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float 1.000000e+00, float addrspace(1)* %48, align 4, !tbaa !11
  %49 = or i32 %26, 2
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = mul nsw i32 %52, %2
  %54 = add i32 %53, %13
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  store float 1.000000e+00, float addrspace(1)* %56, align 4, !tbaa !11
  %57 = add i32 %52, %16
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  store float 1.000000e+00, float addrspace(1)* %59, align 4, !tbaa !11
  %60 = or i32 %26, 3
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = mul nsw i32 %63, %2
  %65 = add i32 %64, %13
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float 1.000000e+00, float addrspace(1)* %67, align 4, !tbaa !11
  %68 = add i32 %63, %16
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  store float 1.000000e+00, float addrspace(1)* %70, align 4, !tbaa !11
  %71 = or i32 %26, 4
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = mul nsw i32 %74, %2
  %76 = add i32 %75, %13
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  store float 1.000000e+00, float addrspace(1)* %78, align 4, !tbaa !11
  %79 = add i32 %74, %16
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  store float 1.000000e+00, float addrspace(1)* %81, align 4, !tbaa !11
  %82 = or i32 %26, 5
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = mul nsw i32 %85, %2
  %87 = add i32 %86, %13
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  store float 1.000000e+00, float addrspace(1)* %89, align 4, !tbaa !11
  %90 = add i32 %85, %16
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  store float 1.000000e+00, float addrspace(1)* %92, align 4, !tbaa !11
  %93 = or i32 %26, 6
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = mul nsw i32 %96, %2
  %98 = add i32 %97, %13
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  store float 1.000000e+00, float addrspace(1)* %100, align 4, !tbaa !11
  %101 = add i32 %96, %16
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  store float 1.000000e+00, float addrspace(1)* %103, align 4, !tbaa !11
  %104 = or i32 %26, 7
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = mul nsw i32 %107, %2
  %109 = add i32 %108, %13
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float 1.000000e+00, float addrspace(1)* %111, align 4, !tbaa !11
  %112 = add i32 %107, %16
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  store float 1.000000e+00, float addrspace(1)* %114, align 4, !tbaa !11
  %115 = add nuw nsw i32 %26, 8
  %116 = add i32 %27, 8
  %117 = icmp eq i32 %116, %24
  br i1 %117, label %118, label %25, !llvm.loop !13

118:                                              ; preds = %25, %20
  %119 = phi i32 [ 0, %20 ], [ %115, %25 ]
  %120 = icmp eq i32 %21, 0
  br i1 %120, label %137, label %121

121:                                              ; preds = %118, %121
  %122 = phi i32 [ %134, %121 ], [ %119, %118 ]
  %123 = phi i32 [ %135, %121 ], [ 0, %118 ]
  %124 = zext i32 %122 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = mul nsw i32 %126, %2
  %128 = add i32 %127, %13
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  store float 1.000000e+00, float addrspace(1)* %130, align 4, !tbaa !11
  %131 = add i32 %126, %16
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  store float 1.000000e+00, float addrspace(1)* %133, align 4, !tbaa !11
  %134 = add nuw nsw i32 %122, 1
  %135 = add i32 %123, 1
  %136 = icmp eq i32 %135, %21
  br i1 %136, label %137, label %121, !llvm.loop !15

137:                                              ; preds = %118, %121, %15, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
