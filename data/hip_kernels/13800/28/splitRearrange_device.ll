; ModuleID = '../data/hip_kernels/13800/28/main.cu'
source_filename = "../data/hip_kernels/13800/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }

@_ZZ14splitRearrangeiiPjS_S_S_S_E7histo_s = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16
@_ZZ14splitRearrangeiiPjS_S_S_S_E7array_s = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14splitRearrangeiiPjS_S_S_S_(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 10
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = shl nuw nsw i32 %10, 2
  %12 = add i32 %9, %11
  %13 = icmp ult i32 %10, 16
  br i1 %13, label %14, label %34

14:                                               ; preds = %7
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !5
  %19 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !14, !invariant.load !15
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %18, %22
  %24 = mul i32 %23, %22
  %25 = icmp ugt i32 %18, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %10
  %29 = add i32 %28, %8
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !15
  %33 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ14splitRearrangeiiPjS_S_S_S_E7histo_s, i32 0, i32 %10
  store i32 %32, i32 addrspace(3)* %33, align 4, !tbaa !16
  br label %34

34:                                               ; preds = %14, %7
  %35 = icmp slt i32 %12, %0
  br i1 %35, label %36, label %54

36:                                               ; preds = %34
  %37 = sext i32 %12 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 16, !amdgpu.noclobber !15
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 1
  %41 = load i32, i32 addrspace(1)* %40, align 4, !amdgpu.noclobber !15
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 2
  %43 = load i32, i32 addrspace(1)* %42, align 8, !amdgpu.noclobber !15
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 3
  %45 = load i32, i32 addrspace(1)* %44, align 4, !amdgpu.noclobber !15
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %37
  %47 = load i32, i32 addrspace(1)* %46, align 16, !amdgpu.noclobber !15
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %46, i64 1
  %49 = load i32, i32 addrspace(1)* %48, align 4, !amdgpu.noclobber !15
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %46, i64 2
  %51 = load i32, i32 addrspace(1)* %50, align 8, !amdgpu.noclobber !15
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %46, i64 3
  %53 = load i32, i32 addrspace(1)* %52, align 4, !amdgpu.noclobber !15
  br label %54

54:                                               ; preds = %34, %36
  %55 = phi i32 [ %45, %36 ], [ -1, %34 ]
  %56 = phi i32 [ %43, %36 ], [ -1, %34 ]
  %57 = phi i32 [ %41, %36 ], [ -1, %34 ]
  %58 = phi i32 [ %39, %36 ], [ -1, %34 ]
  %59 = phi i32 [ %53, %36 ], [ undef, %34 ]
  %60 = phi i32 [ %51, %36 ], [ undef, %34 ]
  %61 = phi i32 [ %49, %36 ], [ undef, %34 ]
  %62 = phi i32 [ %47, %36 ], [ undef, %34 ]
  %63 = shl i32 %1, 2
  %64 = add i32 %63, 4
  %65 = shl nsw i32 -1, %64
  %66 = xor i32 %65, -1
  %67 = and i32 %58, %66
  %68 = lshr i32 %67, %63
  %69 = and i32 %57, %66
  %70 = lshr i32 %69, %63
  %71 = and i32 %56, %66
  %72 = lshr i32 %71, %63
  %73 = and i32 %55, %66
  %74 = lshr i32 %73, %63
  %75 = insertelement <4 x i32> undef, i32 %68, i64 0
  %76 = insertelement <4 x i32> %75, i32 %70, i64 1
  %77 = insertelement <4 x i32> %76, i32 %72, i64 2
  %78 = insertelement <4 x i32> %77, i32 %74, i64 3
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(3)* bitcast ([1024 x i32] addrspace(3)* @_ZZ14splitRearrangeiiPjS_S_S_S_E7array_s to %struct.HIP_vector_type addrspace(3)*), i32 %10, i32 0, i32 0, i32 0
  store <4 x i32> %78, <4 x i32> addrspace(3)* %79, align 16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ14splitRearrangeiiPjS_S_S_S_E7histo_s, i32 0, i32 %68
  %81 = load i32, i32 addrspace(3)* %80, align 4, !tbaa !16
  %82 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ14splitRearrangeiiPjS_S_S_S_E7histo_s, i32 0, i32 %70
  %83 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !16
  %84 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ14splitRearrangeiiPjS_S_S_S_E7histo_s, i32 0, i32 %72
  %85 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !16
  %86 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ14splitRearrangeiiPjS_S_S_S_E7histo_s, i32 0, i32 %74
  %87 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !16
  %88 = insertelement <4 x i32> undef, i32 %81, i64 0
  %89 = insertelement <4 x i32> %88, i32 %83, i64 1
  %90 = insertelement <4 x i32> %89, i32 %85, i64 2
  %91 = insertelement <4 x i32> %90, i32 %87, i64 3
  %92 = icmp eq i32 %10, 0
  br i1 %92, label %107, label %93

93:                                               ; preds = %54, %100
  %94 = phi i32 [ %96, %100 ], [ %11, %54 ]
  %95 = phi <4 x i32> [ %103, %100 ], [ %91, %54 ]
  %96 = add nsw i32 %94, -1
  %97 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ14splitRearrangeiiPjS_S_S_S_E7array_s, i32 0, i32 %96
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !16
  %99 = icmp eq i32 %98, %68
  br i1 %99, label %100, label %107

100:                                              ; preds = %93
  %101 = extractelement <4 x i32> %95, i64 0
  %102 = add i32 %101, 1
  %103 = insertelement <4 x i32> %95, i32 %102, i64 0
  %104 = icmp ugt i32 %94, 1
  br i1 %104, label %93, label %105, !llvm.loop !20

105:                                              ; preds = %100
  %106 = insertelement <4 x i32> %95, i32 %102, i64 0
  br label %107

107:                                              ; preds = %93, %105, %54
  %108 = phi <4 x i32> [ %106, %105 ], [ %91, %54 ], [ %95, %93 ]
  %109 = icmp eq i32 %70, %68
  %110 = extractelement <4 x i32> %108, i64 0
  %111 = add i32 %110, 1
  %112 = extractelement <4 x i32> %108, i64 1
  %113 = select i1 %109, i32 %111, i32 %112
  %114 = icmp eq i32 %72, %70
  %115 = add i32 %113, 1
  %116 = extractelement <4 x i32> %108, i64 2
  %117 = select i1 %114, i32 %115, i32 %116
  br i1 %35, label %118, label %135

118:                                              ; preds = %107
  %119 = icmp eq i32 %74, %72
  %120 = add i32 %117, 1
  %121 = extractelement <4 x i32> %108, i64 3
  %122 = select i1 %119, i32 %120, i32 %121
  %123 = zext i32 %110 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %123
  store i32 %58, i32 addrspace(1)* %124, align 4, !tbaa !16
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %123
  store i32 %62, i32 addrspace(1)* %125, align 4, !tbaa !16
  %126 = zext i32 %113 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %126
  store i32 %57, i32 addrspace(1)* %127, align 4, !tbaa !16
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %126
  store i32 %61, i32 addrspace(1)* %128, align 4, !tbaa !16
  %129 = zext i32 %117 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %129
  store i32 %56, i32 addrspace(1)* %130, align 4, !tbaa !16
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %129
  store i32 %60, i32 addrspace(1)* %131, align 4, !tbaa !16
  %132 = zext i32 %122 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %132
  store i32 %55, i32 addrspace(1)* %133, align 4, !tbaa !16
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %132
  store i32 %59, i32 addrspace(1)* %134, align 4, !tbaa !16
  br label %135

135:                                              ; preds = %118, %107
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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
