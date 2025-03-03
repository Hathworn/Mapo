; ModuleID = '../data/hip_kernels/16427/3/main.cu'
source_filename = "../data/hip_kernels/16427/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14horspool_matchPcS_PiPjiiiiS1_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readnone %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = add i32 %17, %10
  %19 = icmp sgt i32 %18, %5
  br i1 %19, label %144, label %20

20:                                               ; preds = %9
  %21 = mul nsw i32 %18, %4
  %22 = add nsw i32 %7, -1
  %23 = add i32 %22, %4
  %24 = add i32 %23, %21
  %25 = add i32 %22, %21
  %26 = icmp slt i32 %25, %24
  %27 = icmp slt i32 %25, %6
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %69

29:                                               ; preds = %20
  %30 = icmp sgt i32 %7, 0
  br label %31

31:                                               ; preds = %29, %63
  %32 = phi i32 [ %25, %29 ], [ %65, %63 ]
  %33 = phi i32 [ 0, %29 ], [ %64, %63 ]
  br i1 %30, label %34, label %49

34:                                               ; preds = %31, %46
  %35 = phi i32 [ %47, %46 ], [ 0, %31 ]
  %36 = xor i32 %35, -1
  %37 = add i32 %36, %7
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !6
  %41 = sub nsw i32 %32, %35
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !6
  %45 = icmp eq i8 %40, %44
  br i1 %45, label %46, label %49

46:                                               ; preds = %34
  %47 = add nuw nsw i32 %35, 1
  %48 = icmp eq i32 %47, %7
  br i1 %48, label %49, label %34, !llvm.loop !10

49:                                               ; preds = %34, %46, %31
  %50 = phi i32 [ 0, %31 ], [ %35, %34 ], [ %7, %46 ]
  %51 = icmp eq i32 %50, %7
  br i1 %51, label %52, label %55

52:                                               ; preds = %49
  %53 = add nsw i32 %33, 1
  %54 = add nsw i32 %32, 1
  br label %63

55:                                               ; preds = %49
  %56 = sext i32 %32 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !7, !amdgpu.noclobber !6
  %59 = sext i8 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !12, !amdgpu.noclobber !6
  %62 = add nsw i32 %61, %32
  br label %63

63:                                               ; preds = %55, %52
  %64 = phi i32 [ %53, %52 ], [ %33, %55 ]
  %65 = phi i32 [ %54, %52 ], [ %62, %55 ]
  %66 = icmp slt i32 %65, %24
  %67 = icmp slt i32 %65, %6
  %68 = select i1 %66, i1 %67, i1 false
  br i1 %68, label %31, label %69, !llvm.loop !14

69:                                               ; preds = %63, %20
  %70 = phi i32 [ 0, %20 ], [ %64, %63 ]
  %71 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %10
  store i32 %70, i32 addrspace(3)* %71, align 4, !tbaa !12
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp eq i32 %10, 0
  br i1 %72, label %76, label %144

73:                                               ; preds = %76
  %74 = zext i32 %16 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %74
  store i32 %141, i32 addrspace(1)* %75, align 4, !tbaa !12
  br label %144

76:                                               ; preds = %69, %76
  %77 = phi i32 [ %142, %76 ], [ 0, %69 ]
  %78 = phi i32 [ %141, %76 ], [ 0, %69 ]
  %79 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %77
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !12
  %81 = add nsw i32 %80, %78
  %82 = or i32 %77, 1
  %83 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %82
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !12
  %85 = add nsw i32 %84, %81
  %86 = or i32 %77, 2
  %87 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %86
  %88 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !12
  %89 = add nsw i32 %88, %85
  %90 = or i32 %77, 3
  %91 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %90
  %92 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !12
  %93 = add nsw i32 %92, %89
  %94 = or i32 %77, 4
  %95 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %94
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !12
  %97 = add nsw i32 %96, %93
  %98 = or i32 %77, 5
  %99 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !12
  %101 = add nsw i32 %100, %97
  %102 = or i32 %77, 6
  %103 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %102
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !12
  %105 = add nsw i32 %104, %101
  %106 = or i32 %77, 7
  %107 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %106
  %108 = load i32, i32 addrspace(3)* %107, align 4, !tbaa !12
  %109 = add nsw i32 %108, %105
  %110 = or i32 %77, 8
  %111 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %110
  %112 = load i32, i32 addrspace(3)* %111, align 4, !tbaa !12
  %113 = add nsw i32 %112, %109
  %114 = or i32 %77, 9
  %115 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %114
  %116 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !12
  %117 = add nsw i32 %116, %113
  %118 = or i32 %77, 10
  %119 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %118
  %120 = load i32, i32 addrspace(3)* %119, align 4, !tbaa !12
  %121 = add nsw i32 %120, %117
  %122 = or i32 %77, 11
  %123 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %122
  %124 = load i32, i32 addrspace(3)* %123, align 4, !tbaa !12
  %125 = add nsw i32 %124, %121
  %126 = or i32 %77, 12
  %127 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %126
  %128 = load i32, i32 addrspace(3)* %127, align 4, !tbaa !12
  %129 = add nsw i32 %128, %125
  %130 = or i32 %77, 13
  %131 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %130
  %132 = load i32, i32 addrspace(3)* %131, align 4, !tbaa !12
  %133 = add nsw i32 %132, %129
  %134 = or i32 %77, 14
  %135 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %134
  %136 = load i32, i32 addrspace(3)* %135, align 4, !tbaa !12
  %137 = add nsw i32 %136, %133
  %138 = or i32 %77, 15
  %139 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %138
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !12
  %141 = add nsw i32 %140, %137
  %142 = add nuw nsw i32 %77, 16
  %143 = icmp eq i32 %142, 512
  br i1 %143, label %73, label %76, !llvm.loop !15

144:                                              ; preds = %69, %73, %9
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
