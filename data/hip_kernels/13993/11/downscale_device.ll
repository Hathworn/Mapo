; ModuleID = '../data/hip_kernels/13993/11/main.cu'
source_filename = "../data/hip_kernels/13993/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9downscalePfS_liiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i64 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %10, %14
  %19 = add i32 %18, %8
  %20 = zext i32 %19 to i64
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %17, %14
  %28 = mul i32 %27, %14
  %29 = icmp ugt i32 %17, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %22, %14
  %33 = mul i32 %32, %26
  %34 = mul i32 %33, %31
  %35 = add i32 %34, %21
  %36 = zext i32 %35 to i64
  %37 = add nuw nsw i64 %36, %20
  %38 = icmp slt i64 %37, %2
  %39 = icmp sgt i32 %3, 0
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %132

41:                                               ; preds = %7
  %42 = trunc i64 %37 to i32
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %44 = freeze i32 %42
  %45 = freeze i32 %6
  %46 = sdiv i32 %44, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %44, %47
  %49 = freeze i32 %5
  %50 = sdiv i32 %46, %49
  %51 = mul i32 %50, %49
  %52 = sub i32 %46, %51
  %53 = freeze i32 %50
  %54 = mul i32 %53, %5
  %55 = add i32 %54, %52
  %56 = mul i32 %55, %3
  %57 = and i32 %3, 3
  %58 = icmp ult i32 %3, 4
  %59 = and i32 %3, -4
  %60 = icmp eq i32 %57, 0
  br label %61

61:                                               ; preds = %41, %83
  %62 = phi i32 [ 0, %41 ], [ %84, %83 ]
  %63 = load float, float addrspace(1)* %43, align 4, !tbaa !16
  br i1 %58, label %64, label %86

64:                                               ; preds = %86, %61
  %65 = phi float [ %63, %61 ], [ %128, %86 ]
  %66 = phi i32 [ 0, %61 ], [ %129, %86 ]
  br i1 %60, label %83, label %67

67:                                               ; preds = %64, %67
  %68 = phi float [ %79, %67 ], [ %65, %64 ]
  %69 = phi i32 [ %80, %67 ], [ %66, %64 ]
  %70 = phi i32 [ %81, %67 ], [ 0, %64 ]
  %71 = add i32 %56, %69
  %72 = mul i32 %71, %6
  %73 = add i32 %72, %48
  %74 = mul i32 %73, %3
  %75 = add i32 %74, %62
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = fadd contract float %78, %68
  store float %79, float addrspace(1)* %43, align 4, !tbaa !16
  %80 = add nuw nsw i32 %69, 1
  %81 = add i32 %70, 1
  %82 = icmp eq i32 %81, %57
  br i1 %82, label %83, label %67, !llvm.loop !20

83:                                               ; preds = %67, %64
  %84 = add nuw nsw i32 %62, 1
  %85 = icmp eq i32 %84, %3
  br i1 %85, label %132, label %61, !llvm.loop !22

86:                                               ; preds = %61, %86
  %87 = phi float [ %128, %86 ], [ %63, %61 ]
  %88 = phi i32 [ %129, %86 ], [ 0, %61 ]
  %89 = phi i32 [ %130, %86 ], [ 0, %61 ]
  %90 = add i32 %56, %88
  %91 = mul i32 %90, %6
  %92 = add i32 %91, %48
  %93 = mul i32 %92, %3
  %94 = add i32 %93, %62
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fadd contract float %97, %87
  store float %98, float addrspace(1)* %43, align 4, !tbaa !16
  %99 = or i32 %88, 1
  %100 = add i32 %56, %99
  %101 = mul i32 %100, %6
  %102 = add i32 %101, %48
  %103 = mul i32 %102, %3
  %104 = add i32 %103, %62
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fadd contract float %107, %98
  store float %108, float addrspace(1)* %43, align 4, !tbaa !16
  %109 = or i32 %88, 2
  %110 = add i32 %56, %109
  %111 = mul i32 %110, %6
  %112 = add i32 %111, %48
  %113 = mul i32 %112, %3
  %114 = add i32 %113, %62
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = fadd contract float %117, %108
  store float %118, float addrspace(1)* %43, align 4, !tbaa !16
  %119 = or i32 %88, 3
  %120 = add i32 %56, %119
  %121 = mul i32 %120, %6
  %122 = add i32 %121, %48
  %123 = mul i32 %122, %3
  %124 = add i32 %123, %62
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = fadd contract float %127, %118
  store float %128, float addrspace(1)* %43, align 4, !tbaa !16
  %129 = add nuw nsw i32 %88, 4
  %130 = add i32 %89, 4
  %131 = icmp eq i32 %130, %59
  br i1 %131, label %64, label %86, !llvm.loop !24

132:                                              ; preds = %83, %7
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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
