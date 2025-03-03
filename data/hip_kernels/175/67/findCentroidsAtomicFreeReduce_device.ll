; ModuleID = '../data/hip_kernels/175/67/main.cu'
source_filename = "../data/hip_kernels/175/67/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29findCentroidsAtomicFreeReduceiPiiS_S_Pj(i32 %0, i32 addrspace(1)* nocapture readnone %1, i32 %2, i32 addrspace(1)* nocapture readnone %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %173

9:                                                ; preds = %6
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl nuw nsw i32 %10, 6
  %13 = add nsw i32 %12, %11
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !5
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !14, !invariant.load !15
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %17, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %72, label %28

28:                                               ; preds = %9
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 16
  %30 = bitcast i8 addrspace(4)* %29 to i32 addrspace(4)*
  %31 = load i32, i32 addrspace(4)* %30, align 8, !tbaa !16
  %32 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 2, !range !14, !invariant.load !15
  %35 = zext i16 %34 to i32
  %36 = udiv i32 %31, %35
  %37 = mul i32 %36, %35
  %38 = icmp ugt i32 %31, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = add i32 %22, %25
  %42 = add i32 %41, -1
  %43 = and i32 %26, 7
  %44 = icmp ult i32 %42, 7
  br i1 %44, label %47, label %45

45:                                               ; preds = %28
  %46 = and i32 %26, -8
  br label %78

47:                                               ; preds = %78, %28
  %48 = phi i32 [ undef, %28 ], [ %166, %78 ]
  %49 = phi i32 [ undef, %28 ], [ %169, %78 ]
  %50 = phi i32 [ 0, %28 ], [ %166, %78 ]
  %51 = phi i32 [ 0, %28 ], [ %170, %78 ]
  %52 = phi i32 [ 0, %28 ], [ %169, %78 ]
  %53 = icmp eq i32 %43, 0
  br i1 %53, label %72, label %54

54:                                               ; preds = %47, %54
  %55 = phi i32 [ %65, %54 ], [ %50, %47 ]
  %56 = phi i32 [ %69, %54 ], [ %51, %47 ]
  %57 = phi i32 [ %68, %54 ], [ %52, %47 ]
  %58 = phi i32 [ %70, %54 ], [ 0, %47 ]
  %59 = mul i32 %56, %21
  %60 = mul i32 %59, %40
  %61 = add i32 %60, %13
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !17, !amdgpu.noclobber !15
  %65 = add nsw i32 %64, %55
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %62
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !17, !amdgpu.noclobber !15
  %68 = add i32 %67, %57
  %69 = add nuw nsw i32 %56, 1
  %70 = add i32 %58, 1
  %71 = icmp eq i32 %70, %43
  br i1 %71, label %72, label %54, !llvm.loop !21

72:                                               ; preds = %47, %54, %9
  %73 = phi i32 [ 0, %9 ], [ %49, %47 ], [ %68, %54 ]
  %74 = phi i32 [ 0, %9 ], [ %48, %47 ], [ %65, %54 ]
  %75 = sext i32 %13 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %75
  store i32 %74, i32 addrspace(1)* %76, align 4, !tbaa !17
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %75
  store i32 %73, i32 addrspace(1)* %77, align 4, !tbaa !17
  br label %173

78:                                               ; preds = %78, %45
  %79 = phi i32 [ 0, %45 ], [ %166, %78 ]
  %80 = phi i32 [ 0, %45 ], [ %170, %78 ]
  %81 = phi i32 [ 0, %45 ], [ %169, %78 ]
  %82 = phi i32 [ 0, %45 ], [ %171, %78 ]
  %83 = mul i32 %80, %21
  %84 = mul i32 %83, %40
  %85 = add i32 %84, %13
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !17, !amdgpu.noclobber !15
  %89 = add nsw i32 %88, %79
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %86
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !17, !amdgpu.noclobber !15
  %92 = add i32 %91, %81
  %93 = or i32 %80, 1
  %94 = mul i32 %93, %21
  %95 = mul i32 %94, %40
  %96 = add i32 %95, %13
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !17, !amdgpu.noclobber !15
  %100 = add nsw i32 %99, %89
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %97
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !17, !amdgpu.noclobber !15
  %103 = add i32 %102, %92
  %104 = or i32 %80, 2
  %105 = mul i32 %104, %21
  %106 = mul i32 %105, %40
  %107 = add i32 %106, %13
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !17, !amdgpu.noclobber !15
  %111 = add nsw i32 %110, %100
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %108
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !17, !amdgpu.noclobber !15
  %114 = add i32 %113, %103
  %115 = or i32 %80, 3
  %116 = mul i32 %115, %21
  %117 = mul i32 %116, %40
  %118 = add i32 %117, %13
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !17, !amdgpu.noclobber !15
  %122 = add nsw i32 %121, %111
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %119
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !17, !amdgpu.noclobber !15
  %125 = add i32 %124, %114
  %126 = or i32 %80, 4
  %127 = mul i32 %126, %21
  %128 = mul i32 %127, %40
  %129 = add i32 %128, %13
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !17, !amdgpu.noclobber !15
  %133 = add nsw i32 %132, %122
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %130
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !17, !amdgpu.noclobber !15
  %136 = add i32 %135, %125
  %137 = or i32 %80, 5
  %138 = mul i32 %137, %21
  %139 = mul i32 %138, %40
  %140 = add i32 %139, %13
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !17, !amdgpu.noclobber !15
  %144 = add nsw i32 %143, %133
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %141
  %146 = load i32, i32 addrspace(1)* %145, align 4, !tbaa !17, !amdgpu.noclobber !15
  %147 = add i32 %146, %136
  %148 = or i32 %80, 6
  %149 = mul i32 %148, %21
  %150 = mul i32 %149, %40
  %151 = add i32 %150, %13
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !17, !amdgpu.noclobber !15
  %155 = add nsw i32 %154, %144
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %152
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !17, !amdgpu.noclobber !15
  %158 = add i32 %157, %147
  %159 = or i32 %80, 7
  %160 = mul i32 %159, %21
  %161 = mul i32 %160, %40
  %162 = add i32 %161, %13
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %163
  %165 = load i32, i32 addrspace(1)* %164, align 4, !tbaa !17, !amdgpu.noclobber !15
  %166 = add nsw i32 %165, %155
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %163
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !17, !amdgpu.noclobber !15
  %169 = add i32 %168, %158
  %170 = add nuw nsw i32 %80, 8
  %171 = add i32 %82, 8
  %172 = icmp eq i32 %171, %46
  br i1 %172, label %47, label %78, !llvm.loop !23

173:                                              ; preds = %72, %6
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
!16 = !{!6, !10, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
