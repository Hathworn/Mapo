; ModuleID = '../data/hip_kernels/12683/3/main.cu'
source_filename = "../data/hip_kernels/12683/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9downscalePfS_liiiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i64 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul i32 %12, %16
  %21 = add i32 %20, %10
  %22 = zext i32 %21 to i64
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %19, %16
  %30 = mul i32 %29, %16
  %31 = icmp ugt i32 %19, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %24, %16
  %35 = mul i32 %34, %28
  %36 = mul i32 %35, %33
  %37 = add i32 %36, %23
  %38 = zext i32 %37 to i64
  %39 = add nuw nsw i64 %38, %22
  %40 = icmp slt i64 %39, %2
  %41 = icmp sgt i32 %3, 0
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %43, label %149

43:                                               ; preds = %9
  %44 = icmp sgt i32 %4, 0
  %45 = trunc i64 %39 to i32
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %47 = and i32 %4, 3
  %48 = icmp ult i32 %4, 4
  %49 = and i32 %4, -4
  %50 = icmp eq i32 %47, 0
  br label %51

51:                                               ; preds = %43, %78
  %52 = phi i32 [ 0, %43 ], [ %79, %78 ]
  br i1 %44, label %53, label %78

53:                                               ; preds = %51
  %54 = freeze i32 %45
  %55 = freeze i32 %8
  %56 = sdiv i32 %54, %55
  %57 = mul i32 %56, %55
  %58 = sub i32 %54, %57
  %59 = freeze i32 %7
  %60 = sdiv i32 %56, %59
  %61 = mul i32 %60, %59
  %62 = sub i32 %56, %61
  %63 = freeze i32 %6
  %64 = sdiv i32 %60, %63
  %65 = mul i32 %64, %63
  %66 = sub i32 %60, %65
  %67 = freeze i32 %64
  %68 = mul i32 %67, %6
  %69 = add i32 %68, %66
  %70 = mul i32 %69, %3
  %71 = add i32 %70, %52
  %72 = mul i32 %71, %7
  %73 = add i32 %72, %62
  %74 = mul i32 %73, %4
  br label %75

75:                                               ; preds = %53, %100
  %76 = phi i32 [ %101, %100 ], [ 0, %53 ]
  %77 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  br i1 %48, label %81, label %103

78:                                               ; preds = %100, %51
  %79 = add nuw nsw i32 %52, 1
  %80 = icmp eq i32 %79, %3
  br i1 %80, label %149, label %51, !llvm.loop !20

81:                                               ; preds = %103, %75
  %82 = phi float [ %77, %75 ], [ %145, %103 ]
  %83 = phi i32 [ 0, %75 ], [ %146, %103 ]
  br i1 %50, label %100, label %84

84:                                               ; preds = %81, %84
  %85 = phi float [ %96, %84 ], [ %82, %81 ]
  %86 = phi i32 [ %97, %84 ], [ %83, %81 ]
  %87 = phi i32 [ %98, %84 ], [ 0, %81 ]
  %88 = add i32 %74, %86
  %89 = mul i32 %88, %8
  %90 = add i32 %89, %58
  %91 = mul i32 %90, %4
  %92 = add i32 %91, %76
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = fadd contract float %95, %85
  store float %96, float addrspace(1)* %46, align 4, !tbaa !16
  %97 = add nuw nsw i32 %86, 1
  %98 = add i32 %87, 1
  %99 = icmp eq i32 %98, %47
  br i1 %99, label %100, label %84, !llvm.loop !22

100:                                              ; preds = %84, %81
  %101 = add nuw nsw i32 %76, 1
  %102 = icmp eq i32 %101, %4
  br i1 %102, label %78, label %75, !llvm.loop !24

103:                                              ; preds = %75, %103
  %104 = phi float [ %145, %103 ], [ %77, %75 ]
  %105 = phi i32 [ %146, %103 ], [ 0, %75 ]
  %106 = phi i32 [ %147, %103 ], [ 0, %75 ]
  %107 = add i32 %74, %105
  %108 = mul i32 %107, %8
  %109 = add i32 %108, %58
  %110 = mul i32 %109, %4
  %111 = add i32 %110, %76
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = fadd contract float %114, %104
  store float %115, float addrspace(1)* %46, align 4, !tbaa !16
  %116 = or i32 %105, 1
  %117 = add i32 %74, %116
  %118 = mul i32 %117, %8
  %119 = add i32 %118, %58
  %120 = mul i32 %119, %4
  %121 = add i32 %120, %76
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = fadd contract float %124, %115
  store float %125, float addrspace(1)* %46, align 4, !tbaa !16
  %126 = or i32 %105, 2
  %127 = add i32 %74, %126
  %128 = mul i32 %127, %8
  %129 = add i32 %128, %58
  %130 = mul i32 %129, %4
  %131 = add i32 %130, %76
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = fadd contract float %134, %125
  store float %135, float addrspace(1)* %46, align 4, !tbaa !16
  %136 = or i32 %105, 3
  %137 = add i32 %74, %136
  %138 = mul i32 %137, %8
  %139 = add i32 %138, %58
  %140 = mul i32 %139, %4
  %141 = add i32 %140, %76
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !16
  %145 = fadd contract float %144, %135
  store float %145, float addrspace(1)* %46, align 4, !tbaa !16
  %146 = add nuw nsw i32 %105, 4
  %147 = add i32 %106, 4
  %148 = icmp eq i32 %147, %49
  br i1 %148, label %81, label %103, !llvm.loop !25

149:                                              ; preds = %78, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
