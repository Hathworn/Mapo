; ModuleID = '../data/hip_kernels/18288/10/main.cu'
source_filename = "../data/hip_kernels/18288/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28weighted_interpolate_forwardiiiiiPKiS0_PKfS2_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp slt i32 %11, %0
  br i1 %12, label %13, label %29

13:                                               ; preds = %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = mul nsw i32 %3, %1
  %16 = icmp slt i32 %14, %15
  %17 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !5
  %23 = load i16, i16 addrspace(4)* %19, align 4, !range !14, !invariant.load !15
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %22, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %22, %26
  %28 = zext i1 %27 to i32
  br label %30

29:                                               ; preds = %36, %10
  ret void

30:                                               ; preds = %13, %36
  %31 = phi i32 [ %11, %13 ], [ %38, %36 ]
  br i1 %16, label %32, label %36

32:                                               ; preds = %30
  %33 = mul nsw i32 %31, %1
  %34 = mul nsw i32 %31, %2
  %35 = mul nsw i32 %33, %3
  br label %40

36:                                               ; preds = %87, %30
  %37 = add i32 %25, %31
  %38 = add i32 %37, %28
  %39 = icmp slt i32 %38, %0
  br i1 %39, label %30, label %29, !llvm.loop !16

40:                                               ; preds = %32, %87
  %41 = phi i32 [ %14, %32 ], [ %88, %87 ]
  %42 = freeze i32 %41
  %43 = freeze i32 %3
  %44 = sdiv i32 %42, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %42, %45
  %47 = add nsw i32 %44, %33
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !18, !amdgpu.noclobber !15
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %87

52:                                               ; preds = %40
  %53 = mul i32 %47, %4
  %54 = add nsw i32 %41, %35
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %9, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !22
  %58 = and i32 %50, 3
  %59 = icmp ult i32 %50, 4
  br i1 %59, label %62, label %60

60:                                               ; preds = %52
  %61 = and i32 %50, -4
  br label %90

62:                                               ; preds = %90, %52
  %63 = phi float [ %57, %52 ], [ %152, %90 ]
  %64 = phi i32 [ 0, %52 ], [ %153, %90 ]
  %65 = icmp eq i32 %58, 0
  br i1 %65, label %87, label %66

66:                                               ; preds = %62, %66
  %67 = phi float [ %83, %66 ], [ %63, %62 ]
  %68 = phi i32 [ %84, %66 ], [ %64, %62 ]
  %69 = phi i32 [ %85, %66 ], [ 0, %62 ]
  %70 = add nsw i32 %68, %53
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !18, !amdgpu.noclobber !15
  %74 = getelementptr inbounds float, float addrspace(1)* %8, i64 %71
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !22
  %76 = add i32 %73, %34
  %77 = mul i32 %76, %3
  %78 = add nsw i32 %77, %46
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %7, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !22
  %82 = fmul contract float %75, %81
  %83 = fadd contract float %67, %82
  store float %83, float addrspace(1)* %56, align 4, !tbaa !22
  %84 = add nuw nsw i32 %68, 1
  %85 = add i32 %69, 1
  %86 = icmp eq i32 %85, %58
  br i1 %86, label %87, label %66, !llvm.loop !24

87:                                               ; preds = %62, %66, %40
  %88 = add i32 %41, %24
  %89 = icmp slt i32 %88, %15
  br i1 %89, label %40, label %36, !llvm.loop !26

90:                                               ; preds = %90, %60
  %91 = phi float [ %57, %60 ], [ %152, %90 ]
  %92 = phi i32 [ 0, %60 ], [ %153, %90 ]
  %93 = phi i32 [ 0, %60 ], [ %154, %90 ]
  %94 = add nsw i32 %92, %53
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !18, !amdgpu.noclobber !15
  %98 = getelementptr inbounds float, float addrspace(1)* %8, i64 %95
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !22
  %100 = add i32 %97, %34
  %101 = mul i32 %100, %3
  %102 = add nsw i32 %101, %46
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %7, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !22
  %106 = fmul contract float %99, %105
  %107 = fadd contract float %91, %106
  store float %107, float addrspace(1)* %56, align 4, !tbaa !22
  %108 = or i32 %92, 1
  %109 = add nsw i32 %108, %53
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !18, !amdgpu.noclobber !15
  %113 = getelementptr inbounds float, float addrspace(1)* %8, i64 %110
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !22
  %115 = add i32 %112, %34
  %116 = mul i32 %115, %3
  %117 = add nsw i32 %116, %46
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %7, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !22
  %121 = fmul contract float %114, %120
  %122 = fadd contract float %107, %121
  store float %122, float addrspace(1)* %56, align 4, !tbaa !22
  %123 = or i32 %92, 2
  %124 = add nsw i32 %123, %53
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !18, !amdgpu.noclobber !15
  %128 = getelementptr inbounds float, float addrspace(1)* %8, i64 %125
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !22
  %130 = add i32 %127, %34
  %131 = mul i32 %130, %3
  %132 = add nsw i32 %131, %46
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %7, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !22
  %136 = fmul contract float %129, %135
  %137 = fadd contract float %122, %136
  store float %137, float addrspace(1)* %56, align 4, !tbaa !22
  %138 = or i32 %92, 3
  %139 = add nsw i32 %138, %53
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !18, !amdgpu.noclobber !15
  %143 = getelementptr inbounds float, float addrspace(1)* %8, i64 %140
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !22
  %145 = add i32 %142, %34
  %146 = mul i32 %145, %3
  %147 = add nsw i32 %146, %46
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %7, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !22
  %151 = fmul contract float %144, %150
  %152 = fadd contract float %137, %151
  store float %152, float addrspace(1)* %56, align 4, !tbaa !22
  %153 = add nuw nsw i32 %92, 4
  %154 = add i32 %93, 4
  %155 = icmp eq i32 %154, %61
  br i1 %155, label %62, label %90, !llvm.loop !27
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !20, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !17}
!27 = distinct !{!27, !17}
