; ModuleID = '../data/hip_kernels/8929/5/main.cu'
source_filename = "../data/hip_kernels/8929/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13writeSeedListiPKiS0_S0_S0_S0_S0_S0_S0_PiS1_S1_S1_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture writeonly %9, i32 addrspace(1)* nocapture writeonly %10, i32 addrspace(1)* nocapture writeonly %11, i32 addrspace(1)* nocapture writeonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !4
  %19 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !13, !invariant.load !14
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %18, %22
  %24 = mul i32 %23, %22
  %25 = icmp ugt i32 %18, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %14
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %30 = add i32 %28, %29
  %31 = mul i32 %30, %22
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %33 = add i32 %31, %32
  %34 = icmp slt i32 %33, %0
  br i1 %34, label %35, label %146

35:                                               ; preds = %13
  %36 = sext i32 %33 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !14
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %36
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !14
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %36
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !16, !amdgpu.noclobber !14
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %36
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !16, !amdgpu.noclobber !14
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !14
  %47 = icmp sgt i32 %44, 0
  br i1 %47, label %48, label %146

48:                                               ; preds = %35
  %49 = and i32 %44, 3
  %50 = icmp ult i32 %44, 4
  br i1 %50, label %122, label %51

51:                                               ; preds = %48
  %52 = and i32 %44, -4
  br label %53

53:                                               ; preds = %53, %51
  %54 = phi i32 [ 0, %51 ], [ %119, %53 ]
  %55 = phi i32 [ 0, %51 ], [ %120, %53 ]
  %56 = add nsw i32 %54, %42
  %57 = add nsw i32 %54, %46
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !16
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !16
  %64 = sext i32 %56 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %64
  store i32 %63, i32 addrspace(1)* %65, align 4, !tbaa !16
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %61
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !16
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %64
  store i32 %67, i32 addrspace(1)* %68, align 4, !tbaa !16
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %64
  store i32 %38, i32 addrspace(1)* %69, align 4, !tbaa !16
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %64
  store i32 %40, i32 addrspace(1)* %70, align 4, !tbaa !16
  %71 = or i32 %54, 1
  %72 = add nsw i32 %71, %42
  %73 = add nsw i32 %71, %46
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !16
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !16
  %80 = sext i32 %72 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %80
  store i32 %79, i32 addrspace(1)* %81, align 4, !tbaa !16
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %77
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !16
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %80
  store i32 %83, i32 addrspace(1)* %84, align 4, !tbaa !16
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %80
  store i32 %38, i32 addrspace(1)* %85, align 4, !tbaa !16
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %80
  store i32 %40, i32 addrspace(1)* %86, align 4, !tbaa !16
  %87 = or i32 %54, 2
  %88 = add nsw i32 %87, %42
  %89 = add nsw i32 %87, %46
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !16
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !16
  %96 = sext i32 %88 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %96
  store i32 %95, i32 addrspace(1)* %97, align 4, !tbaa !16
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %93
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !16
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %96
  store i32 %99, i32 addrspace(1)* %100, align 4, !tbaa !16
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %96
  store i32 %38, i32 addrspace(1)* %101, align 4, !tbaa !16
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %96
  store i32 %40, i32 addrspace(1)* %102, align 4, !tbaa !16
  %103 = or i32 %54, 3
  %104 = add nsw i32 %103, %42
  %105 = add nsw i32 %103, %46
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !16
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !16
  %112 = sext i32 %104 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %112
  store i32 %111, i32 addrspace(1)* %113, align 4, !tbaa !16
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %109
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !16
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %112
  store i32 %115, i32 addrspace(1)* %116, align 4, !tbaa !16
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %112
  store i32 %38, i32 addrspace(1)* %117, align 4, !tbaa !16
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %112
  store i32 %40, i32 addrspace(1)* %118, align 4, !tbaa !16
  %119 = add nuw nsw i32 %54, 4
  %120 = add i32 %55, 4
  %121 = icmp eq i32 %120, %52
  br i1 %121, label %122, label %53, !llvm.loop !20

122:                                              ; preds = %53, %48
  %123 = phi i32 [ 0, %48 ], [ %119, %53 ]
  %124 = icmp eq i32 %49, 0
  br i1 %124, label %146, label %125

125:                                              ; preds = %122, %125
  %126 = phi i32 [ %143, %125 ], [ %123, %122 ]
  %127 = phi i32 [ %144, %125 ], [ 0, %122 ]
  %128 = add nsw i32 %126, %42
  %129 = add nsw i32 %126, %46
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !16
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !16
  %136 = sext i32 %128 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %136
  store i32 %135, i32 addrspace(1)* %137, align 4, !tbaa !16
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %133
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !16
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %136
  store i32 %139, i32 addrspace(1)* %140, align 4, !tbaa !16
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %136
  store i32 %38, i32 addrspace(1)* %141, align 4, !tbaa !16
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %136
  store i32 %40, i32 addrspace(1)* %142, align 4, !tbaa !16
  %143 = add nuw nsw i32 %126, 1
  %144 = add i32 %127, 1
  %145 = icmp eq i32 %144, %49
  br i1 %145, label %146, label %125, !llvm.loop !22

146:                                              ; preds = %122, %125, %35, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
