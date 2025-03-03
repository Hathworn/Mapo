; ModuleID = '../data/hip_kernels/267/0/main.cu'
source_filename = "../data/hip_kernels/267/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19parallelMeanUnroll2PfmS_(float addrspace(1)* nocapture %0, i64 %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = mul i32 %5, %10
  %15 = shl i32 %14, 1
  %16 = add i32 %15, %4
  %17 = zext i32 %15 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = add i32 %16, %10
  %20 = zext i32 %19 to i64
  %21 = icmp ult i64 %20, %1
  br i1 %21, label %22, label %29

22:                                               ; preds = %3
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !16, !amdgpu.noclobber !6
  %25 = zext i32 %16 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16, !amdgpu.noclobber !6
  %28 = fadd contract float %24, %27
  store float %28, float addrspace(1)* %26, align 4, !tbaa !16
  br label %29

29:                                               ; preds = %22, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i16 %9, 2
  br i1 %30, label %34, label %31

31:                                               ; preds = %29
  %32 = zext i32 %4 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %18, i64 %32
  br label %37

34:                                               ; preds = %48, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = sub nsw i32 0, %4
  %36 = icmp eq i32 %14, %35
  br i1 %36, label %50, label %141

37:                                               ; preds = %31, %48
  %38 = phi i32 [ %10, %31 ], [ %39, %48 ]
  %39 = lshr i32 %38, 1
  %40 = icmp ult i32 %4, %39
  br i1 %40, label %41, label %48

41:                                               ; preds = %37
  %42 = add nuw nsw i32 %39, %4
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %18, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %46 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(1)* %33, align 4, !tbaa !16
  br label %48

48:                                               ; preds = %37, %41
  %49 = icmp ult i32 %38, 4
  br i1 %49, label %34, label %37, !llvm.loop !20

50:                                               ; preds = %34
  store float 0.000000e+00, float addrspace(1)* %2, align 4, !tbaa !16
  %51 = udiv i32 %13, %10
  %52 = mul i32 %51, %10
  %53 = icmp ugt i32 %13, %52
  %54 = zext i1 %53 to i32
  %55 = add i32 %51, %54
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %82, label %57

57:                                               ; preds = %50
  %58 = shl nuw nsw i32 %10, 1
  %59 = add i32 %51, %54
  %60 = add i32 %59, -1
  %61 = and i32 %55, 7
  %62 = icmp ult i32 %60, 7
  br i1 %62, label %65, label %63

63:                                               ; preds = %57
  %64 = and i32 %55, -8
  br label %87

65:                                               ; preds = %87, %57
  %66 = phi float [ undef, %57 ], [ %137, %87 ]
  %67 = phi float [ 0.000000e+00, %57 ], [ %137, %87 ]
  %68 = phi i32 [ 0, %57 ], [ %138, %87 ]
  %69 = icmp eq i32 %61, 0
  br i1 %69, label %82, label %70

70:                                               ; preds = %65, %70
  %71 = phi float [ %78, %70 ], [ %67, %65 ]
  %72 = phi i32 [ %79, %70 ], [ %68, %65 ]
  %73 = phi i32 [ %80, %70 ], [ 0, %65 ]
  %74 = mul i32 %58, %72
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = fadd contract float %77, %71
  store float %78, float addrspace(1)* %2, align 4, !tbaa !16
  %79 = add nuw i32 %72, 1
  %80 = add i32 %73, 1
  %81 = icmp eq i32 %80, %61
  br i1 %81, label %82, label %70, !llvm.loop !22

82:                                               ; preds = %65, %70, %50
  %83 = phi float [ 0.000000e+00, %50 ], [ %66, %65 ], [ %78, %70 ]
  %84 = add i64 %1, -1
  %85 = uitofp i64 %84 to float
  %86 = fdiv contract float %83, %85
  store float %86, float addrspace(1)* %2, align 4, !tbaa !16
  br label %141

87:                                               ; preds = %87, %63
  %88 = phi float [ 0.000000e+00, %63 ], [ %137, %87 ]
  %89 = phi i32 [ 0, %63 ], [ %138, %87 ]
  %90 = phi i32 [ 0, %63 ], [ %139, %87 ]
  %91 = mul i32 %58, %89
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = fadd contract float %94, %88
  store float %95, float addrspace(1)* %2, align 4, !tbaa !16
  %96 = or i32 %89, 1
  %97 = mul i32 %58, %96
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fadd contract float %100, %95
  store float %101, float addrspace(1)* %2, align 4, !tbaa !16
  %102 = or i32 %89, 2
  %103 = mul i32 %58, %102
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = fadd contract float %106, %101
  store float %107, float addrspace(1)* %2, align 4, !tbaa !16
  %108 = or i32 %89, 3
  %109 = mul i32 %58, %108
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = fadd contract float %112, %107
  store float %113, float addrspace(1)* %2, align 4, !tbaa !16
  %114 = or i32 %89, 4
  %115 = mul i32 %58, %114
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !16
  %119 = fadd contract float %118, %113
  store float %119, float addrspace(1)* %2, align 4, !tbaa !16
  %120 = or i32 %89, 5
  %121 = mul i32 %58, %120
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = fadd contract float %124, %119
  store float %125, float addrspace(1)* %2, align 4, !tbaa !16
  %126 = or i32 %89, 6
  %127 = mul i32 %58, %126
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = fadd contract float %130, %125
  store float %131, float addrspace(1)* %2, align 4, !tbaa !16
  %132 = or i32 %89, 7
  %133 = mul i32 %58, %132
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = fadd contract float %136, %131
  store float %137, float addrspace(1)* %2, align 4, !tbaa !16
  %138 = add nuw i32 %89, 8
  %139 = add i32 %90, 8
  %140 = icmp eq i32 %139, %64
  br i1 %140, label %65, label %87, !llvm.loop !24

141:                                              ; preds = %82, %34
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
