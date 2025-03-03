; ModuleID = '../data/hip_kernels/17141/8/main.cu'
source_filename = "../data/hip_kernels/17141/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22BernoulliNBLearnKernelPfS_PKfjjj(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readnone %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %5
  %17 = icmp ne i32 %4, 0
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %139

19:                                               ; preds = %6
  %20 = icmp eq i32 %15, 0
  %21 = uitofp i32 %3 to float
  br i1 %20, label %27, label %22

22:                                               ; preds = %19
  %23 = and i32 %4, 3
  %24 = icmp ult i32 %4, 4
  br i1 %24, label %121, label %25

25:                                               ; preds = %22
  %26 = and i32 %4, -4
  br label %32

27:                                               ; preds = %19
  %28 = and i32 %4, 1
  %29 = icmp eq i32 %4, 1
  br i1 %29, label %106, label %30

30:                                               ; preds = %27
  %31 = and i32 %4, -2
  br label %77

32:                                               ; preds = %32, %25
  %33 = phi i32 [ 0, %25 ], [ %74, %32 ]
  %34 = phi i32 [ 0, %25 ], [ %75, %32 ]
  %35 = zext i32 %33 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %38 = mul i32 %33, %5
  %39 = add i32 %38, %15
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fdiv contract float %42, %37
  store float %43, float addrspace(1)* %41, align 4, !tbaa !7
  %44 = or i32 %33, 1
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = mul i32 %44, %5
  %49 = add i32 %48, %15
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fdiv contract float %52, %47
  store float %53, float addrspace(1)* %51, align 4, !tbaa !7
  %54 = or i32 %33, 2
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = mul i32 %54, %5
  %59 = add i32 %58, %15
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fdiv contract float %62, %57
  store float %63, float addrspace(1)* %61, align 4, !tbaa !7
  %64 = or i32 %33, 3
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = mul i32 %64, %5
  %69 = add i32 %68, %15
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fdiv contract float %72, %67
  store float %73, float addrspace(1)* %71, align 4, !tbaa !7
  %74 = add nuw i32 %33, 4
  %75 = add i32 %34, 4
  %76 = icmp eq i32 %75, %26
  br i1 %76, label %121, label %32, !llvm.loop !11

77:                                               ; preds = %77, %30
  %78 = phi i32 [ 0, %30 ], [ %103, %77 ]
  %79 = phi i32 [ 0, %30 ], [ %104, %77 ]
  %80 = zext i32 %78 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = mul i32 %78, %5
  %84 = add i32 %83, %15
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = fdiv contract float %87, %82
  store float %88, float addrspace(1)* %86, align 4, !tbaa !7
  %89 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %90 = fdiv contract float %89, %21
  store float %90, float addrspace(1)* %81, align 4, !tbaa !7
  %91 = or i32 %78, 1
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = mul i32 %91, %5
  %96 = add i32 %95, %15
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = fdiv contract float %99, %94
  store float %100, float addrspace(1)* %98, align 4, !tbaa !7
  %101 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %102 = fdiv contract float %101, %21
  store float %102, float addrspace(1)* %93, align 4, !tbaa !7
  %103 = add nuw i32 %78, 2
  %104 = add i32 %79, 2
  %105 = icmp eq i32 %104, %31
  br i1 %105, label %106, label %77, !llvm.loop !11

106:                                              ; preds = %77, %27
  %107 = phi i32 [ 0, %27 ], [ %103, %77 ]
  %108 = icmp eq i32 %28, 0
  br i1 %108, label %139, label %109

109:                                              ; preds = %106
  %110 = zext i32 %107 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = mul i32 %107, %5
  %114 = add i32 %113, %15
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fdiv contract float %117, %112
  store float %118, float addrspace(1)* %116, align 4, !tbaa !7
  %119 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %120 = fdiv contract float %119, %21
  store float %120, float addrspace(1)* %111, align 4, !tbaa !7
  br label %139

121:                                              ; preds = %32, %22
  %122 = phi i32 [ 0, %22 ], [ %74, %32 ]
  %123 = icmp eq i32 %23, 0
  br i1 %123, label %139, label %124

124:                                              ; preds = %121, %124
  %125 = phi i32 [ %136, %124 ], [ %122, %121 ]
  %126 = phi i32 [ %137, %124 ], [ 0, %121 ]
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = mul i32 %125, %5
  %131 = add i32 %130, %15
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fdiv contract float %134, %129
  store float %135, float addrspace(1)* %133, align 4, !tbaa !7
  %136 = add nuw i32 %125, 1
  %137 = add i32 %126, 1
  %138 = icmp eq i32 %137, %23
  br i1 %138, label %139, label %124, !llvm.loop !13

139:                                              ; preds = %106, %109, %124, %121, %6
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
