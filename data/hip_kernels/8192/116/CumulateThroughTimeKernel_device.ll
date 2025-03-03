; ModuleID = '../data/hip_kernels/8192/116/main.cu'
source_filename = "../data/hip_kernels/8192/116/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25CumulateThroughTimeKernelPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = udiv i32 %11, %8
  %15 = mul i32 %14, %8
  %16 = icmp ugt i32 %11, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %13
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %12
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %20
  %24 = icmp slt i32 %23, %1
  br i1 %24, label %25, label %126

25:                                               ; preds = %3
  %26 = sext i32 %2 to i64
  %27 = icmp ugt i32 %2, 1
  br i1 %27, label %28, label %126

28:                                               ; preds = %25
  %29 = sext i32 %23 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %32 = add nsw i64 %26, -1
  %33 = add nsw i64 %26, -2
  %34 = and i64 %32, 7
  %35 = icmp ult i64 %33, 7
  br i1 %35, label %108, label %36

36:                                               ; preds = %28
  %37 = and i64 %32, -8
  br label %38

38:                                               ; preds = %38, %36
  %39 = phi float [ %31, %36 ], [ %104, %38 ]
  %40 = phi i64 [ 1, %36 ], [ %105, %38 ]
  %41 = phi i64 [ 0, %36 ], [ %106, %38 ]
  %42 = trunc i64 %40 to i32
  %43 = mul i32 %42, %1
  %44 = add nsw i32 %43, %23
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = fadd contract float %47, %39
  store float %48, float addrspace(1)* %30, align 4, !tbaa !16
  %49 = trunc i64 %40 to i32
  %50 = add i32 %49, 1
  %51 = mul i32 %50, %1
  %52 = add nsw i32 %51, %23
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fadd contract float %55, %48
  store float %56, float addrspace(1)* %30, align 4, !tbaa !16
  %57 = trunc i64 %40 to i32
  %58 = add i32 %57, 2
  %59 = mul i32 %58, %1
  %60 = add nsw i32 %59, %23
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16
  %64 = fadd contract float %63, %56
  store float %64, float addrspace(1)* %30, align 4, !tbaa !16
  %65 = trunc i64 %40 to i32
  %66 = add i32 %65, 3
  %67 = mul i32 %66, %1
  %68 = add nsw i32 %67, %23
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = fadd contract float %71, %64
  store float %72, float addrspace(1)* %30, align 4, !tbaa !16
  %73 = trunc i64 %40 to i32
  %74 = add i32 %73, 4
  %75 = mul i32 %74, %1
  %76 = add nsw i32 %75, %23
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fadd contract float %79, %72
  store float %80, float addrspace(1)* %30, align 4, !tbaa !16
  %81 = trunc i64 %40 to i32
  %82 = add i32 %81, 5
  %83 = mul i32 %82, %1
  %84 = add nsw i32 %83, %23
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = fadd contract float %87, %80
  store float %88, float addrspace(1)* %30, align 4, !tbaa !16
  %89 = trunc i64 %40 to i32
  %90 = add i32 %89, 6
  %91 = mul i32 %90, %1
  %92 = add nsw i32 %91, %23
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = fadd contract float %95, %88
  store float %96, float addrspace(1)* %30, align 4, !tbaa !16
  %97 = trunc i64 %40 to i32
  %98 = add i32 %97, 7
  %99 = mul i32 %98, %1
  %100 = add nsw i32 %99, %23
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = fadd contract float %103, %96
  store float %104, float addrspace(1)* %30, align 4, !tbaa !16
  %105 = add nuw i64 %40, 8
  %106 = add i64 %41, 8
  %107 = icmp eq i64 %106, %37
  br i1 %107, label %108, label %38, !llvm.loop !20

108:                                              ; preds = %38, %28
  %109 = phi float [ %31, %28 ], [ %104, %38 ]
  %110 = phi i64 [ 1, %28 ], [ %105, %38 ]
  %111 = icmp eq i64 %34, 0
  br i1 %111, label %126, label %112

112:                                              ; preds = %108, %112
  %113 = phi float [ %122, %112 ], [ %109, %108 ]
  %114 = phi i64 [ %123, %112 ], [ %110, %108 ]
  %115 = phi i64 [ %124, %112 ], [ 0, %108 ]
  %116 = trunc i64 %114 to i32
  %117 = mul i32 %116, %1
  %118 = add nsw i32 %117, %23
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = fadd contract float %121, %113
  store float %122, float addrspace(1)* %30, align 4, !tbaa !16
  %123 = add nuw i64 %114, 1
  %124 = add i64 %115, 1
  %125 = icmp eq i64 %124, %34
  br i1 %125, label %126, label %112, !llvm.loop !22

126:                                              ; preds = %108, %112, %25, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
