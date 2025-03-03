; ModuleID = '../data/hip_kernels/14345/5/main.cu'
source_filename = "../data/hip_kernels/14345/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@parts = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12reduceSinglePiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %5, align 4, !tbaa !5
  %6 = icmp slt i32 %4, %2
  br i1 %6, label %7, label %23

7:                                                ; preds = %3
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !9, !invariant.load !10
  %12 = zext i16 %11 to i32
  br label %13

13:                                               ; preds = %7, %13
  %14 = phi i32 [ 0, %7 ], [ %19, %13 ]
  %15 = phi i32 [ %4, %7 ], [ %20, %13 ]
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !10
  %19 = add nsw i32 %14, %18
  %20 = add i32 %15, %12
  %21 = icmp slt i32 %20, %2
  br i1 %21, label %13, label %22, !llvm.loop !11

22:                                               ; preds = %13
  store i32 %19, i32 addrspace(3)* %5, align 4, !tbaa !5
  br label %23

23:                                               ; preds = %22, %3
  %24 = phi i32 [ %19, %22 ], [ 0, %3 ]
  %25 = icmp ult i32 %4, 512
  br i1 %25, label %26, label %31

26:                                               ; preds = %23
  %27 = add nuw nsw i32 %4, 512
  %28 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 %27
  %29 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %30 = add nsw i32 %24, %29
  store i32 %30, i32 addrspace(3)* %5, align 4, !tbaa !5
  br label %31

31:                                               ; preds = %26, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp ult i32 %4, 256
  br i1 %32, label %33, label %39

33:                                               ; preds = %31
  %34 = add nuw nsw i32 %4, 256
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 %34
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !5
  %37 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %38 = add nsw i32 %37, %36
  store i32 %38, i32 addrspace(3)* %5, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %33, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i32 %4, 128
  br i1 %40, label %41, label %47

41:                                               ; preds = %39
  %42 = add nuw nsw i32 %4, 128
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 %42
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %45 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %46 = add nsw i32 %45, %44
  store i32 %46, i32 addrspace(3)* %5, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %41, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %4, 64
  br i1 %48, label %49, label %55

49:                                               ; preds = %47
  %50 = add nuw nsw i32 %4, 64
  %51 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !5
  %53 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %54 = add nsw i32 %53, %52
  store i32 %54, i32 addrspace(3)* %5, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %49, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i32 %4, 32
  br i1 %56, label %57, label %63

57:                                               ; preds = %55
  %58 = add nuw nsw i32 %4, 32
  %59 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 %58
  %60 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !5
  %61 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %62 = add nsw i32 %61, %60
  store i32 %62, i32 addrspace(3)* %5, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %57, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = icmp eq i32 %4, 0
  br i1 %64, label %65, label %129

65:                                               ; preds = %63
  %66 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 0), align 4, !tbaa !5
  %67 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 1), align 4, !tbaa !5
  %68 = add nsw i32 %66, %67
  %69 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 2), align 4, !tbaa !5
  %70 = add nsw i32 %68, %69
  %71 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 3), align 4, !tbaa !5
  %72 = add nsw i32 %70, %71
  %73 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 4), align 4, !tbaa !5
  %74 = add nsw i32 %72, %73
  %75 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 5), align 4, !tbaa !5
  %76 = add nsw i32 %74, %75
  %77 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 6), align 4, !tbaa !5
  %78 = add nsw i32 %76, %77
  %79 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 7), align 4, !tbaa !5
  %80 = add nsw i32 %78, %79
  %81 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 8), align 4, !tbaa !5
  %82 = add nsw i32 %80, %81
  %83 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 9), align 4, !tbaa !5
  %84 = add nsw i32 %82, %83
  %85 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 10), align 4, !tbaa !5
  %86 = add nsw i32 %84, %85
  %87 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 11), align 4, !tbaa !5
  %88 = add nsw i32 %86, %87
  %89 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 12), align 4, !tbaa !5
  %90 = add nsw i32 %88, %89
  %91 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 13), align 4, !tbaa !5
  %92 = add nsw i32 %90, %91
  %93 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 14), align 4, !tbaa !5
  %94 = add nsw i32 %92, %93
  %95 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 15), align 4, !tbaa !5
  %96 = add nsw i32 %94, %95
  %97 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 16), align 4, !tbaa !5
  %98 = add nsw i32 %96, %97
  %99 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 17), align 4, !tbaa !5
  %100 = add nsw i32 %98, %99
  %101 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 18), align 4, !tbaa !5
  %102 = add nsw i32 %100, %101
  %103 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 19), align 4, !tbaa !5
  %104 = add nsw i32 %102, %103
  %105 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 20), align 4, !tbaa !5
  %106 = add nsw i32 %104, %105
  %107 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 21), align 4, !tbaa !5
  %108 = add nsw i32 %106, %107
  %109 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 22), align 4, !tbaa !5
  %110 = add nsw i32 %108, %109
  %111 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 23), align 4, !tbaa !5
  %112 = add nsw i32 %110, %111
  %113 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 24), align 4, !tbaa !5
  %114 = add nsw i32 %112, %113
  %115 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 25), align 4, !tbaa !5
  %116 = add nsw i32 %114, %115
  %117 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 26), align 4, !tbaa !5
  %118 = add nsw i32 %116, %117
  %119 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 27), align 4, !tbaa !5
  %120 = add nsw i32 %118, %119
  %121 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 28), align 4, !tbaa !5
  %122 = add nsw i32 %120, %121
  %123 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 29), align 4, !tbaa !5
  %124 = add nsw i32 %122, %123
  %125 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 30), align 4, !tbaa !5
  %126 = add nsw i32 %124, %125
  %127 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @parts, i32 0, i32 31), align 4, !tbaa !5
  %128 = add nsw i32 %126, %127
  store i32 %128, i32 addrspace(1)* %1, align 4, !tbaa !5
  br label %129

129:                                              ; preds = %65, %63
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
