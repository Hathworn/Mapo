; ModuleID = '../data/hip_kernels/3557/53/main.cu'
source_filename = "../data/hip_kernels/3557/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19cudaSPadding_kerneljjjjjjjiiiiPKfPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture writeonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 8
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %22 = add i32 %20, %21
  %23 = mul i32 %22, %3
  %24 = mul i32 %22, %0
  %25 = tail call i32 @llvm.umin.i32(i32 %3, i32 %0)
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = icmp ult i32 %26, %25
  br i1 %27, label %28, label %48

28:                                               ; preds = %13
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %30 = icmp ult i32 %29, %2
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %32 = icmp ult i32 %31, %1
  %33 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4
  %36 = zext i16 %35 to i32
  %37 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %38 = bitcast i8 addrspace(4)* %37 to i16 addrspace(4)*
  %39 = load i16, i16 addrspace(4)* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %42 = bitcast i8 addrspace(4)* %41 to i32 addrspace(4)*
  %43 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %44 = udiv i32 %43, %36
  %45 = mul i32 %44, %36
  %46 = icmp ugt i32 %43, %45
  %47 = zext i1 %46 to i32
  br label %49

48:                                               ; preds = %56, %13
  ret void

49:                                               ; preds = %28, %56
  %50 = phi i32 [ %26, %28 ], [ %58, %56 ]
  br i1 %30, label %51, label %56

51:                                               ; preds = %49
  %52 = add i32 %50, %23
  %53 = mul i32 %52, %6
  %54 = add i32 %50, %24
  %55 = mul i32 %54, %2
  br label %60

56:                                               ; preds = %70, %49
  %57 = add i32 %44, %50
  %58 = add i32 %57, %47
  %59 = icmp ult i32 %58, %25
  br i1 %59, label %49, label %48, !llvm.loop !16

60:                                               ; preds = %51, %70
  %61 = phi i32 [ %29, %51 ], [ %71, %70 ]
  br i1 %32, label %62, label %70

62:                                               ; preds = %60
  %63 = sub nsw i32 %61, %9
  %64 = icmp sgt i32 %63, -1
  %65 = icmp slt i32 %63, %6
  %66 = add i32 %53, %63
  %67 = mul i32 %66, %5
  %68 = add i32 %55, %61
  %69 = mul i32 %68, %1
  br label %73

70:                                               ; preds = %86, %60
  %71 = add i32 %61, %40
  %72 = icmp ult i32 %71, %2
  br i1 %72, label %60, label %56, !llvm.loop !18

73:                                               ; preds = %62, %86
  %74 = phi i32 [ %31, %62 ], [ %91, %86 ]
  %75 = sub nsw i32 %74, %7
  %76 = icmp sgt i32 %75, -1
  br i1 %76, label %77, label %86

77:                                               ; preds = %73
  %78 = icmp slt i32 %75, %5
  %79 = select i1 %78, i1 %64, i1 false
  %80 = select i1 %79, i1 %65, i1 false
  br i1 %80, label %81, label %86

81:                                               ; preds = %77
  %82 = add i32 %75, %67
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %11, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !19
  br label %86

86:                                               ; preds = %81, %77, %73
  %87 = phi float [ %85, %81 ], [ 0.000000e+00, %77 ], [ 0.000000e+00, %73 ]
  %88 = add i32 %74, %69
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %12, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !19
  %91 = add i32 %74, %36
  %92 = icmp ult i32 %91, %1
  br i1 %92, label %73, label %70, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !17}
