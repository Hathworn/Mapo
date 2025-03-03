; ModuleID = '../data/hip_kernels/7964/1/main.cu'
source_filename = "../data/hip_kernels/7964/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9downscalePfS_liiiiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i64 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %13, %17
  %22 = add i32 %21, %11
  %23 = zext i32 %22 to i64
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = udiv i32 %20, %17
  %31 = mul i32 %30, %17
  %32 = icmp ugt i32 %20, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %25, %17
  %36 = mul i32 %35, %29
  %37 = mul i32 %36, %34
  %38 = add i32 %37, %24
  %39 = zext i32 %38 to i64
  %40 = add nuw nsw i64 %39, %23
  %41 = icmp slt i64 %40, %2
  %42 = icmp sgt i32 %3, 0
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %151

44:                                               ; preds = %10
  %45 = icmp sgt i32 %4, 0
  %46 = icmp sgt i32 %5, 0
  %47 = trunc i64 %40 to i32
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %49 = and i32 %5, 3
  %50 = icmp ult i32 %5, 4
  %51 = and i32 %5, -4
  %52 = icmp eq i32 %49, 0
  br label %53

53:                                               ; preds = %44, %80
  %54 = phi i32 [ 0, %44 ], [ %81, %80 ]
  br i1 %45, label %55, label %80

55:                                               ; preds = %53, %102
  %56 = phi i32 [ %103, %102 ], [ 0, %53 ]
  br i1 %46, label %57, label %102

57:                                               ; preds = %55
  %58 = freeze i32 %47
  %59 = freeze i32 %9
  %60 = sdiv i32 %58, %59
  %61 = mul i32 %60, %59
  %62 = sub i32 %58, %61
  %63 = freeze i32 %8
  %64 = sdiv i32 %60, %63
  %65 = mul i32 %64, %63
  %66 = sub i32 %60, %65
  %67 = freeze i32 %7
  %68 = sdiv i32 %64, %67
  %69 = mul i32 %68, %67
  %70 = sub i32 %64, %69
  %71 = freeze i32 %68
  %72 = mul i32 %71, %7
  %73 = add i32 %72, %70
  %74 = mul i32 %73, %3
  %75 = add i32 %74, %54
  %76 = mul i32 %75, %8
  %77 = add i32 %76, %66
  %78 = mul i32 %77, %4
  %79 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  br i1 %50, label %83, label %105

80:                                               ; preds = %102, %53
  %81 = add nuw nsw i32 %54, 1
  %82 = icmp eq i32 %81, %3
  br i1 %82, label %151, label %53, !llvm.loop !20

83:                                               ; preds = %105, %57
  %84 = phi float [ %79, %57 ], [ %147, %105 ]
  %85 = phi i32 [ 0, %57 ], [ %148, %105 ]
  br i1 %52, label %102, label %86

86:                                               ; preds = %83, %86
  %87 = phi float [ %98, %86 ], [ %84, %83 ]
  %88 = phi i32 [ %99, %86 ], [ %85, %83 ]
  %89 = phi i32 [ %100, %86 ], [ 0, %83 ]
  %90 = add i32 %78, %88
  %91 = mul i32 %90, %9
  %92 = add i32 %91, %62
  %93 = mul i32 %92, %5
  %94 = add i32 %93, %56
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fadd contract float %97, %87
  store float %98, float addrspace(1)* %48, align 4, !tbaa !16
  %99 = add nuw nsw i32 %88, 1
  %100 = add i32 %89, 1
  %101 = icmp eq i32 %100, %49
  br i1 %101, label %102, label %86, !llvm.loop !22

102:                                              ; preds = %83, %86, %55
  %103 = add nuw nsw i32 %56, 1
  %104 = icmp eq i32 %103, %4
  br i1 %104, label %80, label %55, !llvm.loop !24

105:                                              ; preds = %57, %105
  %106 = phi float [ %147, %105 ], [ %79, %57 ]
  %107 = phi i32 [ %148, %105 ], [ 0, %57 ]
  %108 = phi i32 [ %149, %105 ], [ 0, %57 ]
  %109 = add i32 %78, %107
  %110 = mul i32 %109, %9
  %111 = add i32 %110, %62
  %112 = mul i32 %111, %5
  %113 = add i32 %112, %56
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16
  %117 = fadd contract float %116, %106
  store float %117, float addrspace(1)* %48, align 4, !tbaa !16
  %118 = or i32 %107, 1
  %119 = add i32 %78, %118
  %120 = mul i32 %119, %9
  %121 = add i32 %120, %62
  %122 = mul i32 %121, %5
  %123 = add i32 %122, %56
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = fadd contract float %126, %117
  store float %127, float addrspace(1)* %48, align 4, !tbaa !16
  %128 = or i32 %107, 2
  %129 = add i32 %78, %128
  %130 = mul i32 %129, %9
  %131 = add i32 %130, %62
  %132 = mul i32 %131, %5
  %133 = add i32 %132, %56
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = fadd contract float %136, %127
  store float %137, float addrspace(1)* %48, align 4, !tbaa !16
  %138 = or i32 %107, 3
  %139 = add i32 %78, %138
  %140 = mul i32 %139, %9
  %141 = add i32 %140, %62
  %142 = mul i32 %141, %5
  %143 = add i32 %142, %56
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = fadd contract float %146, %137
  store float %147, float addrspace(1)* %48, align 4, !tbaa !16
  %148 = add nuw nsw i32 %107, 4
  %149 = add i32 %108, 4
  %150 = icmp eq i32 %149, %51
  br i1 %150, label %83, label %105, !llvm.loop !25

151:                                              ; preds = %80, %10
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
