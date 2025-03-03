; ModuleID = '../data/hip_kernels/17662/0/main.cu'
source_filename = "../data/hip_kernels/17662/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11_slowKernelPci(i8 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = mul i32 %3, %8
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %1
  br i1 %15, label %16, label %139

16:                                               ; preds = %2
  %17 = udiv i32 %11, %8
  %18 = mul i32 %17, %8
  %19 = icmp ugt i32 %11, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  br label %23

23:                                               ; preds = %16, %32
  %24 = phi i32 [ %14, %16 ], [ %33, %32 ]
  %25 = add nsw i32 %24, 1007
  %26 = srem i32 %25, %1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %27
  %29 = sext i32 %24 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !16
  br label %35

32:                                               ; preds = %35
  %33 = add i32 %22, %24
  %34 = icmp slt i32 %33, %1
  br i1 %34, label %23, label %139, !llvm.loop !19

35:                                               ; preds = %35, %23
  %36 = phi i8 [ %31, %23 ], [ %136, %35 ]
  %37 = phi i32 [ 0, %23 ], [ %137, %35 ]
  %38 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %39 = trunc i32 %37 to i8
  %40 = add i8 %38, %39
  %41 = add i8 %40, %36
  store i8 %41, i8 addrspace(1)* %30, align 1, !tbaa !16
  %42 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %43 = trunc i32 %37 to i8
  %44 = or i8 %43, 1
  %45 = add i8 %42, %44
  %46 = add i8 %45, %41
  store i8 %46, i8 addrspace(1)* %30, align 1, !tbaa !16
  %47 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %48 = trunc i32 %37 to i8
  %49 = or i8 %48, 2
  %50 = add i8 %47, %49
  %51 = add i8 %50, %46
  store i8 %51, i8 addrspace(1)* %30, align 1, !tbaa !16
  %52 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %53 = trunc i32 %37 to i8
  %54 = or i8 %53, 3
  %55 = add i8 %52, %54
  %56 = add i8 %55, %51
  store i8 %56, i8 addrspace(1)* %30, align 1, !tbaa !16
  %57 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %58 = trunc i32 %37 to i8
  %59 = add i8 %58, 4
  %60 = add i8 %57, %59
  %61 = add i8 %60, %56
  store i8 %61, i8 addrspace(1)* %30, align 1, !tbaa !16
  %62 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %63 = trunc i32 %37 to i8
  %64 = add i8 %63, 5
  %65 = add i8 %62, %64
  %66 = add i8 %65, %61
  store i8 %66, i8 addrspace(1)* %30, align 1, !tbaa !16
  %67 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %68 = trunc i32 %37 to i8
  %69 = add i8 %68, 6
  %70 = add i8 %67, %69
  %71 = add i8 %70, %66
  store i8 %71, i8 addrspace(1)* %30, align 1, !tbaa !16
  %72 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %73 = trunc i32 %37 to i8
  %74 = add i8 %73, 7
  %75 = add i8 %72, %74
  %76 = add i8 %75, %71
  store i8 %76, i8 addrspace(1)* %30, align 1, !tbaa !16
  %77 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %78 = trunc i32 %37 to i8
  %79 = add i8 %78, 8
  %80 = add i8 %77, %79
  %81 = add i8 %80, %76
  store i8 %81, i8 addrspace(1)* %30, align 1, !tbaa !16
  %82 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %83 = trunc i32 %37 to i8
  %84 = add i8 %83, 9
  %85 = add i8 %82, %84
  %86 = add i8 %85, %81
  store i8 %86, i8 addrspace(1)* %30, align 1, !tbaa !16
  %87 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %88 = trunc i32 %37 to i8
  %89 = add i8 %88, 10
  %90 = add i8 %87, %89
  %91 = add i8 %90, %86
  store i8 %91, i8 addrspace(1)* %30, align 1, !tbaa !16
  %92 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %93 = trunc i32 %37 to i8
  %94 = add i8 %93, 11
  %95 = add i8 %92, %94
  %96 = add i8 %95, %91
  store i8 %96, i8 addrspace(1)* %30, align 1, !tbaa !16
  %97 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %98 = trunc i32 %37 to i8
  %99 = add i8 %98, 12
  %100 = add i8 %97, %99
  %101 = add i8 %100, %96
  store i8 %101, i8 addrspace(1)* %30, align 1, !tbaa !16
  %102 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %103 = trunc i32 %37 to i8
  %104 = add i8 %103, 13
  %105 = add i8 %102, %104
  %106 = add i8 %105, %101
  store i8 %106, i8 addrspace(1)* %30, align 1, !tbaa !16
  %107 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %108 = trunc i32 %37 to i8
  %109 = add i8 %108, 14
  %110 = add i8 %107, %109
  %111 = add i8 %110, %106
  store i8 %111, i8 addrspace(1)* %30, align 1, !tbaa !16
  %112 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %113 = trunc i32 %37 to i8
  %114 = add i8 %113, 15
  %115 = add i8 %112, %114
  %116 = add i8 %115, %111
  store i8 %116, i8 addrspace(1)* %30, align 1, !tbaa !16
  %117 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %118 = trunc i32 %37 to i8
  %119 = add i8 %118, 16
  %120 = add i8 %117, %119
  %121 = add i8 %120, %116
  store i8 %121, i8 addrspace(1)* %30, align 1, !tbaa !16
  %122 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %123 = trunc i32 %37 to i8
  %124 = add i8 %123, 17
  %125 = add i8 %122, %124
  %126 = add i8 %125, %121
  store i8 %126, i8 addrspace(1)* %30, align 1, !tbaa !16
  %127 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %128 = trunc i32 %37 to i8
  %129 = add i8 %128, 18
  %130 = add i8 %127, %129
  %131 = add i8 %130, %126
  store i8 %131, i8 addrspace(1)* %30, align 1, !tbaa !16
  %132 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %133 = trunc i32 %37 to i8
  %134 = add i8 %133, 19
  %135 = add i8 %132, %134
  %136 = add i8 %135, %131
  store i8 %136, i8 addrspace(1)* %30, align 1, !tbaa !16
  %137 = add nuw nsw i32 %37, 20
  %138 = icmp eq i32 %137, 100000
  br i1 %138, label %32, label %35, !llvm.loop !21

139:                                              ; preds = %32, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
