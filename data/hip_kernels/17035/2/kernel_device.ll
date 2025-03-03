; ModuleID = '../data/hip_kernels/17035/2/main.cu'
source_filename = "../data/hip_kernels/17035/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6kernelPfS_iiiE4smem = internal unnamed_addr addrspace(3) global [6 x [6 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6kernelPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 8, !tbaa !16
  %26 = mul i32 %18, %22
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %28 = add i32 %26, %27
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %30 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !4, !invariant.load !5
  %33 = zext i16 %32 to i32
  %34 = mul i32 %29, %33
  %35 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %36 = add i32 %34, %35
  %37 = mul nsw i32 %3, %2
  %38 = mul nsw i32 %37, %4
  %39 = icmp slt i32 %17, %2
  %40 = icmp slt i32 %28, %3
  %41 = select i1 %39, i1 %40, i1 false
  %42 = icmp slt i32 %36, %4
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %130

44:                                               ; preds = %5
  %45 = mul i32 %36, %3
  %46 = add i32 %45, %28
  %47 = mul i32 %46, %2
  %48 = add i32 %47, %17
  %49 = udiv i32 %14, %11
  %50 = mul i32 %49, %11
  %51 = icmp ugt i32 %14, %50
  %52 = zext i1 %51 to i32
  %53 = add i32 %49, %52
  %54 = udiv i32 %25, %22
  %55 = mul i32 %54, %22
  %56 = icmp ugt i32 %25, %55
  %57 = zext i1 %56 to i32
  %58 = add i32 %54, %57
  %59 = mul i32 %58, %29
  %60 = add i32 %59, %18
  %61 = mul i32 %60, %53
  %62 = add i32 %61, %6
  %63 = mul i32 %62, %22
  %64 = add i32 %63, %27
  %65 = mul i32 %64, %11
  %66 = add i32 %65, %16
  %67 = mul nuw nsw i32 %27, 6
  %68 = add nuw nsw i32 %67, %16
  %69 = trunc i32 %68 to i16
  %70 = freeze i16 %69
  %71 = udiv i16 %70, 6
  %72 = zext i16 %71 to i32
  %73 = mul i16 %71, 6
  %74 = sub i16 %70, %73
  %75 = zext i16 %74 to i32
  %76 = icmp ult i32 %68, 36
  br i1 %76, label %77, label %93

77:                                               ; preds = %44
  %78 = icmp sgt i32 %17, -1
  br i1 %78, label %79, label %90

79:                                               ; preds = %77
  %80 = icmp slt i32 %28, %2
  %81 = icmp sgt i32 %28, -1
  %82 = and i1 %80, %81
  %83 = icmp sgt i32 %36, -1
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %85, label %90

85:                                               ; preds = %79
  %86 = sext i32 %66 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !17, !amdgpu.noclobber !5
  %89 = fptoui float %88 to i8
  br label %90

90:                                               ; preds = %77, %79, %85
  %91 = phi i8 [ %89, %85 ], [ 0, %79 ], [ 0, %77 ]
  %92 = getelementptr inbounds [6 x [6 x i8]], [6 x [6 x i8]] addrspace(3)* @_ZZ6kernelPfS_iiiE4smem, i32 0, i32 %72, i32 %75
  store i8 %91, i8 addrspace(3)* %92, align 1, !tbaa !21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %93

93:                                               ; preds = %90, %44
  %94 = icmp ult i16 %69, 12
  br i1 %94, label %100, label %95

95:                                               ; preds = %93
  %96 = add nsw i32 %72, -2
  %97 = getelementptr inbounds [6 x [6 x i8]], [6 x [6 x i8]] addrspace(3)* @_ZZ6kernelPfS_iiiE4smem, i32 0, i32 %96, i32 %75
  %98 = load i8, i8 addrspace(3)* %97, align 1, !tbaa !21
  %99 = uitofp i8 %98 to float
  br label %100

100:                                              ; preds = %93, %95
  %101 = phi float [ %99, %95 ], [ 0.000000e+00, %93 ]
  %102 = icmp ult i16 %69, 6
  br i1 %102, label %108, label %103

103:                                              ; preds = %100
  %104 = add nsw i32 %72, -1
  %105 = getelementptr inbounds [6 x [6 x i8]], [6 x [6 x i8]] addrspace(3)* @_ZZ6kernelPfS_iiiE4smem, i32 0, i32 %104, i32 %75
  %106 = load i8, i8 addrspace(3)* %105, align 1, !tbaa !21
  %107 = uitofp i8 %106 to float
  br label %108

108:                                              ; preds = %100, %103
  %109 = phi float [ %107, %103 ], [ 0.000000e+00, %100 ]
  %110 = icmp slt i32 %48, %38
  br i1 %110, label %111, label %130

111:                                              ; preds = %108
  %112 = fadd contract float %101, %109
  %113 = getelementptr inbounds [6 x [6 x i8]], [6 x [6 x i8]] addrspace(3)* @_ZZ6kernelPfS_iiiE4smem, i32 0, i32 %72, i32 %75
  %114 = load i8, i8 addrspace(3)* %113, align 1, !tbaa !21
  %115 = uitofp i8 %114 to float
  %116 = fadd contract float %112, %115
  %117 = add nuw nsw i32 %72, 1
  %118 = getelementptr inbounds [6 x [6 x i8]], [6 x [6 x i8]] addrspace(3)* @_ZZ6kernelPfS_iiiE4smem, i32 0, i32 %117, i32 %75
  %119 = load i8, i8 addrspace(3)* %118, align 1, !tbaa !21
  %120 = uitofp i8 %119 to float
  %121 = fadd contract float %116, %120
  %122 = add nuw nsw i32 %72, 2
  %123 = getelementptr inbounds [6 x [6 x i8]], [6 x [6 x i8]] addrspace(3)* @_ZZ6kernelPfS_iiiE4smem, i32 0, i32 %122, i32 %75
  %124 = load i8, i8 addrspace(3)* %123, align 1, !tbaa !21
  %125 = uitofp i8 %124 to float
  %126 = fadd contract float %121, %125
  %127 = fdiv contract float %126, 5.000000e+00
  %128 = sext i32 %48 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  store float %127, float addrspace(1)* %129, align 4, !tbaa !17
  br label %130

130:                                              ; preds = %108, %111, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!16 = !{!7, !11, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!19, !19, i64 0}
