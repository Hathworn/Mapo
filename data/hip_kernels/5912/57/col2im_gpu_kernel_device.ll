; ModuleID = '../data/hip_kernels/5912/57/main.cu'
source_filename = "../data/hip_kernels/5912/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17col2im_gpu_kerneliPKfiiiiiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %24, label %106

24:                                               ; preds = %10
  %25 = mul nsw i32 %3, %2
  %26 = mul i32 %7, %6
  %27 = mul i32 %26, %4
  %28 = sub nsw i32 1, %27
  %29 = mul nsw i32 %26, %8
  %30 = sub nsw i32 1, %29
  %31 = udiv i32 %19, %16
  %32 = mul i32 %31, %16
  %33 = icmp ugt i32 %19, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %16
  br label %37

37:                                               ; preds = %24, %83
  %38 = phi i32 [ %22, %24 ], [ %89, %83 ]
  %39 = freeze i32 %38
  %40 = freeze i32 %3
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %41, %40
  %43 = sub i32 %39, %42
  %44 = add nsw i32 %43, %5
  %45 = srem i32 %41, %2
  %46 = add nsw i32 %45, %5
  %47 = sdiv i32 %38, %25
  %48 = icmp slt i32 %44, %4
  br i1 %48, label %53, label %49

49:                                               ; preds = %37
  %50 = sub nsw i32 %44, %4
  %51 = sdiv i32 %50, %6
  %52 = add nsw i32 %51, 1
  br label %53

53:                                               ; preds = %37, %49
  %54 = phi i32 [ %52, %49 ], [ 0, %37 ]
  %55 = sdiv i32 %44, %6
  %56 = add nsw i32 %55, 1
  %57 = tail call i32 @llvm.smin.i32(i32 %56, i32 %8)
  %58 = icmp slt i32 %46, %4
  br i1 %58, label %63, label %59

59:                                               ; preds = %53
  %60 = sub nsw i32 %46, %4
  %61 = sdiv i32 %60, %6
  %62 = add nsw i32 %61, 1
  br label %63

63:                                               ; preds = %53, %59
  %64 = phi i32 [ %62, %59 ], [ 0, %53 ]
  %65 = sdiv i32 %46, %6
  %66 = add nsw i32 %65, 1
  %67 = tail call i32 @llvm.smin.i32(i32 %66, i32 %7)
  %68 = mul nsw i32 %47, %4
  %69 = add i32 %68, %46
  %70 = mul i32 %69, %4
  %71 = add nsw i32 %70, %44
  %72 = mul i32 %71, %7
  %73 = icmp slt i32 %64, %67
  br i1 %73, label %74, label %83

74:                                               ; preds = %63
  %75 = icmp slt i32 %54, %57
  br label %76

76:                                               ; preds = %74, %91
  %77 = phi i32 [ %64, %74 ], [ %93, %91 ]
  %78 = phi float [ 0.000000e+00, %74 ], [ %92, %91 ]
  br i1 %75, label %79, label %91

79:                                               ; preds = %76
  %80 = mul i32 %77, %28
  %81 = add i32 %80, %72
  %82 = mul i32 %81, %8
  br label %95

83:                                               ; preds = %91, %63
  %84 = phi float [ 0.000000e+00, %63 ], [ %92, %91 ]
  %85 = sext i32 %38 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %9, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = fadd contract float %84, %87
  store float %88, float addrspace(1)* %86, align 4, !tbaa !16
  %89 = add i32 %36, %38
  %90 = icmp slt i32 %89, %0
  br i1 %90, label %37, label %106, !llvm.loop !20

91:                                               ; preds = %95, %76
  %92 = phi float [ %78, %76 ], [ %103, %95 ]
  %93 = add nsw i32 %77, 1
  %94 = icmp slt i32 %93, %67
  br i1 %94, label %76, label %83, !llvm.loop !22

95:                                               ; preds = %79, %95
  %96 = phi i32 [ %54, %79 ], [ %104, %95 ]
  %97 = phi float [ %78, %79 ], [ %103, %95 ]
  %98 = mul nsw i32 %96, %30
  %99 = add i32 %98, %82
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = fadd contract float %97, %102
  %104 = add nsw i32 %96, 1
  %105 = icmp slt i32 %104, %57
  br i1 %105, label %95, label %91, !llvm.loop !23

106:                                              ; preds = %83, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
