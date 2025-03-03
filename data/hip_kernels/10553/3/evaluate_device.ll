; ModuleID = '../data/hip_kernels/10553/3/main.cu'
source_filename = "../data/hip_kernels/10553/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.chromosome = type <{ i64, i64, [100003 x i8], [5 x i8] }>

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8evaluateP10chromosomePiS1_i(%struct.chromosome addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %55

6:                                                ; preds = %4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 1
  %18 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 0
  %19 = load i64, i64 addrspace(1)* %18, align 8, !tbaa !7
  %20 = and i32 %3, 3
  %21 = icmp ult i32 %3, 4
  br i1 %21, label %24, label %22

22:                                               ; preds = %6
  %23 = and i32 %3, -4
  br label %56

24:                                               ; preds = %124, %6
  %25 = phi i64 [ undef, %6 ], [ %130, %124 ]
  %26 = phi i64 [ %19, %6 ], [ %130, %124 ]
  %27 = phi i32 [ 0, %6 ], [ %131, %124 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %53, label %29

29:                                               ; preds = %24, %43
  %30 = phi i64 [ %49, %43 ], [ %26, %24 ]
  %31 = phi i32 [ %50, %43 ], [ %27, %24 ]
  %32 = phi i32 [ %51, %43 ], [ 0, %24 ]
  %33 = zext i32 %31 to i64
  %34 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 2, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !12, !range !14, !amdgpu.noclobber !5
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %43, label %37

37:                                               ; preds = %29
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !15, !amdgpu.noclobber !5
  %40 = sext i32 %39 to i64
  %41 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !17
  %42 = add nsw i64 %41, %40
  store i64 %42, i64 addrspace(1)* %17, align 8, !tbaa !17
  br label %43

43:                                               ; preds = %37, %29
  %44 = zext i8 %35 to i32
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !15, !amdgpu.noclobber !5
  %47 = mul nuw nsw i32 %46, %44
  %48 = sext i32 %47 to i64
  %49 = add nsw i64 %30, %48
  %50 = add nuw nsw i32 %31, 1
  %51 = add i32 %32, 1
  %52 = icmp eq i32 %51, %20
  br i1 %52, label %53, label %29, !llvm.loop !18

53:                                               ; preds = %43, %24
  %54 = phi i64 [ %25, %24 ], [ %49, %43 ]
  store i64 %54, i64 addrspace(1)* %18, align 8, !tbaa !7
  br label %55

55:                                               ; preds = %53, %4
  ret void

56:                                               ; preds = %124, %22
  %57 = phi i64 [ %19, %22 ], [ %130, %124 ]
  %58 = phi i32 [ 0, %22 ], [ %131, %124 ]
  %59 = phi i32 [ 0, %22 ], [ %132, %124 ]
  %60 = zext i32 %58 to i64
  %61 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 2, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !12, !range !14, !amdgpu.noclobber !5
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %70, label %64

64:                                               ; preds = %56
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !15, !amdgpu.noclobber !5
  %67 = sext i32 %66 to i64
  %68 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !17
  %69 = add nsw i64 %68, %67
  store i64 %69, i64 addrspace(1)* %17, align 8, !tbaa !17
  br label %70

70:                                               ; preds = %64, %56
  %71 = zext i8 %62 to i32
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !15, !amdgpu.noclobber !5
  %74 = mul nuw nsw i32 %73, %71
  %75 = sext i32 %74 to i64
  %76 = add nsw i64 %57, %75
  %77 = or i32 %58, 1
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 2, i64 %78
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !12, !range !14, !amdgpu.noclobber !5
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %88, label %82

82:                                               ; preds = %70
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !15, !amdgpu.noclobber !5
  %85 = sext i32 %84 to i64
  %86 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !17
  %87 = add nsw i64 %86, %85
  store i64 %87, i64 addrspace(1)* %17, align 8, !tbaa !17
  br label %88

88:                                               ; preds = %82, %70
  %89 = zext i8 %80 to i32
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %78
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !15, !amdgpu.noclobber !5
  %92 = mul nuw nsw i32 %91, %89
  %93 = sext i32 %92 to i64
  %94 = add nsw i64 %76, %93
  %95 = or i32 %58, 2
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 2, i64 %96
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !12, !range !14, !amdgpu.noclobber !5
  %99 = icmp eq i8 %98, 0
  br i1 %99, label %106, label %100

100:                                              ; preds = %88
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %96
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !15, !amdgpu.noclobber !5
  %103 = sext i32 %102 to i64
  %104 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !17
  %105 = add nsw i64 %104, %103
  store i64 %105, i64 addrspace(1)* %17, align 8, !tbaa !17
  br label %106

106:                                              ; preds = %100, %88
  %107 = zext i8 %98 to i32
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %96
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !15, !amdgpu.noclobber !5
  %110 = mul nuw nsw i32 %109, %107
  %111 = sext i32 %110 to i64
  %112 = add nsw i64 %94, %111
  %113 = or i32 %58, 3
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %16, i32 2, i64 %114
  %116 = load i8, i8 addrspace(1)* %115, align 1, !tbaa !12, !range !14, !amdgpu.noclobber !5
  %117 = icmp eq i8 %116, 0
  br i1 %117, label %124, label %118

118:                                              ; preds = %106
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !15, !amdgpu.noclobber !5
  %121 = sext i32 %120 to i64
  %122 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !17
  %123 = add nsw i64 %122, %121
  store i64 %123, i64 addrspace(1)* %17, align 8, !tbaa !17
  br label %124

124:                                              ; preds = %118, %106
  %125 = zext i8 %116 to i32
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %114
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !15, !amdgpu.noclobber !5
  %128 = mul nuw nsw i32 %127, %125
  %129 = sext i32 %128 to i64
  %130 = add nsw i64 %112, %129
  %131 = add nuw nsw i32 %58, 4
  %132 = add i32 %59, 4
  %133 = icmp eq i32 %132, %23
  br i1 %133, label %24, label %56, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTS10chromosome", !9, i64 0, !9, i64 8, !10, i64 16}
!9 = !{!"long long", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"bool", !10, i64 0}
!14 = !{i8 0, i8 2}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !10, i64 0}
!17 = !{!8, !9, i64 8}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
