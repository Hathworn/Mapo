; ModuleID = '../data/hip_kernels/324/147/main.cu'
source_filename = "../data/hip_kernels/324/147/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11kSumRowwisePfS_jjff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, float %4, float %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = mul i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = add i32 %21, %22
  %24 = mul i32 %23, %14
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = icmp ult i32 %26, %3
  br i1 %27, label %28, label %115

28:                                               ; preds = %6
  %29 = sext i32 %26 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = icmp eq i32 %2, 0
  br i1 %31, label %54, label %32

32:                                               ; preds = %28
  %33 = and i32 %2, 7
  %34 = icmp ult i32 %2, 8
  br i1 %34, label %37, label %35

35:                                               ; preds = %32
  %36 = and i32 %2, -8
  br label %61

37:                                               ; preds = %61, %32
  %38 = phi float [ undef, %32 ], [ %111, %61 ]
  %39 = phi i32 [ 0, %32 ], [ %112, %61 ]
  %40 = phi float [ 0.000000e+00, %32 ], [ %111, %61 ]
  %41 = icmp eq i32 %33, 0
  br i1 %41, label %54, label %42

42:                                               ; preds = %37, %42
  %43 = phi i32 [ %51, %42 ], [ %39, %37 ]
  %44 = phi float [ %50, %42 ], [ %40, %37 ]
  %45 = phi i32 [ %52, %42 ], [ 0, %37 ]
  %46 = mul i32 %43, %3
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %30, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !14
  %50 = fadd contract float %44, %49
  %51 = add nuw i32 %43, 1
  %52 = add i32 %45, 1
  %53 = icmp eq i32 %52, %33
  br i1 %53, label %54, label %42, !llvm.loop !20

54:                                               ; preds = %37, %42, %28
  %55 = phi float [ 0.000000e+00, %28 ], [ %38, %37 ], [ %50, %42 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16, !amdgpu.noclobber !14
  %58 = fmul contract float %57, %5
  %59 = fmul contract float %55, %4
  %60 = fadd contract float %59, %58
  store float %60, float addrspace(1)* %56, align 4, !tbaa !16
  br label %115

61:                                               ; preds = %61, %35
  %62 = phi i32 [ 0, %35 ], [ %112, %61 ]
  %63 = phi float [ 0.000000e+00, %35 ], [ %111, %61 ]
  %64 = phi i32 [ 0, %35 ], [ %113, %61 ]
  %65 = mul i32 %62, %3
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %30, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16, !amdgpu.noclobber !14
  %69 = fadd contract float %63, %68
  %70 = or i32 %62, 1
  %71 = mul i32 %70, %3
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %30, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16, !amdgpu.noclobber !14
  %75 = fadd contract float %69, %74
  %76 = or i32 %62, 2
  %77 = mul i32 %76, %3
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %30, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16, !amdgpu.noclobber !14
  %81 = fadd contract float %75, %80
  %82 = or i32 %62, 3
  %83 = mul i32 %82, %3
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %30, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16, !amdgpu.noclobber !14
  %87 = fadd contract float %81, %86
  %88 = or i32 %62, 4
  %89 = mul i32 %88, %3
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %30, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !14
  %93 = fadd contract float %87, %92
  %94 = or i32 %62, 5
  %95 = mul i32 %94, %3
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %30, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16, !amdgpu.noclobber !14
  %99 = fadd contract float %93, %98
  %100 = or i32 %62, 6
  %101 = mul i32 %100, %3
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %30, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16, !amdgpu.noclobber !14
  %105 = fadd contract float %99, %104
  %106 = or i32 %62, 7
  %107 = mul i32 %106, %3
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %30, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16, !amdgpu.noclobber !14
  %111 = fadd contract float %105, %110
  %112 = add nuw i32 %62, 8
  %113 = add i32 %64, 8
  %114 = icmp eq i32 %113, %36
  br i1 %114, label %37, label %61, !llvm.loop !22

115:                                              ; preds = %54, %6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
