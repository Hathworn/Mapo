; ModuleID = '../data/hip_kernels/1256/95/main.cu'
source_filename = "../data/hip_kernels/1256/95/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19kernelFeedForward1bPfiS_iS_(float addrspace(1)* nocapture %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  store float 0.000000e+00, float addrspace(1)* %16, align 4, !tbaa !7
  %17 = icmp sgt i32 %1, 0
  br i1 %17, label %18, label %141

18:                                               ; preds = %5
  %19 = mul i32 %13, %1
  %20 = add i32 %19, %3
  %21 = mul i32 %6, %1
  %22 = and i32 %1, 7
  %23 = icmp ult i32 %1, 8
  br i1 %23, label %120, label %24

24:                                               ; preds = %18
  %25 = and i32 %1, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi float [ 0.000000e+00, %24 ], [ %116, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %117, %26 ]
  %29 = phi i32 [ 0, %24 ], [ %118, %26 ]
  %30 = add i32 %20, %28
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = add i32 %28, %21
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %38 = fmul contract float %33, %37
  %39 = fadd contract float %27, %38
  store float %39, float addrspace(1)* %16, align 4, !tbaa !7
  %40 = or i32 %28, 1
  %41 = add i32 %20, %40
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = add i32 %40, %21
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = fmul contract float %44, %48
  %50 = fadd contract float %39, %49
  store float %50, float addrspace(1)* %16, align 4, !tbaa !7
  %51 = or i32 %28, 2
  %52 = add i32 %20, %51
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = add i32 %51, %21
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fmul contract float %55, %59
  %61 = fadd contract float %50, %60
  store float %61, float addrspace(1)* %16, align 4, !tbaa !7
  %62 = or i32 %28, 3
  %63 = add i32 %20, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = add i32 %62, %21
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %4, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fmul contract float %66, %70
  %72 = fadd contract float %61, %71
  store float %72, float addrspace(1)* %16, align 4, !tbaa !7
  %73 = or i32 %28, 4
  %74 = add i32 %20, %73
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = add i32 %73, %21
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %4, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fmul contract float %77, %81
  %83 = fadd contract float %72, %82
  store float %83, float addrspace(1)* %16, align 4, !tbaa !7
  %84 = or i32 %28, 5
  %85 = add i32 %20, %84
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = add i32 %84, %21
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %88, %92
  %94 = fadd contract float %83, %93
  store float %94, float addrspace(1)* %16, align 4, !tbaa !7
  %95 = or i32 %28, 6
  %96 = add i32 %20, %95
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = add i32 %95, %21
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %4, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = fmul contract float %99, %103
  %105 = fadd contract float %94, %104
  store float %105, float addrspace(1)* %16, align 4, !tbaa !7
  %106 = or i32 %28, 7
  %107 = add i32 %20, %106
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = add i32 %106, %21
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %4, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = fmul contract float %110, %114
  %116 = fadd contract float %105, %115
  store float %116, float addrspace(1)* %16, align 4, !tbaa !7
  %117 = add nuw nsw i32 %28, 8
  %118 = add i32 %29, 8
  %119 = icmp eq i32 %118, %25
  br i1 %119, label %120, label %26, !llvm.loop !11

120:                                              ; preds = %26, %18
  %121 = phi float [ 0.000000e+00, %18 ], [ %116, %26 ]
  %122 = phi i32 [ 0, %18 ], [ %117, %26 ]
  %123 = icmp eq i32 %22, 0
  br i1 %123, label %141, label %124

124:                                              ; preds = %120, %124
  %125 = phi float [ %137, %124 ], [ %121, %120 ]
  %126 = phi i32 [ %138, %124 ], [ %122, %120 ]
  %127 = phi i32 [ %139, %124 ], [ 0, %120 ]
  %128 = add i32 %20, %126
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = add i32 %126, %21
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %4, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = fmul contract float %131, %135
  %137 = fadd contract float %125, %136
  store float %137, float addrspace(1)* %16, align 4, !tbaa !7
  %138 = add nuw nsw i32 %126, 1
  %139 = add i32 %127, 1
  %140 = icmp eq i32 %139, %22
  br i1 %140, label %141, label %124, !llvm.loop !13

141:                                              ; preds = %120, %124, %5
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
