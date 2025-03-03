; ModuleID = '../data/hip_kernels/3064/0/main.cu'
source_filename = "../data/hip_kernels/3064/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9matrixMulPiS_S_iiE1A = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16
@_ZZ9matrixMulPiS_S_iiE1B = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9matrixMulPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = mul nsw i32 %9, %4
  %11 = add nsw i32 %10, %7
  %12 = mul nsw i32 %8, %4
  %13 = add nsw i32 %12, %6
  %14 = sdiv i32 %3, %4
  %15 = icmp sgt i32 %14, 0
  %16 = mul nsw i32 %11, %3
  br i1 %15, label %17, label %28

17:                                               ; preds = %5
  %18 = add i32 %16, %6
  %19 = mul nsw i32 %7, %4
  %20 = add nsw i32 %19, %6
  %21 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %20
  %22 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %20
  %23 = icmp sgt i32 %4, 0
  %24 = and i32 %4, 7
  %25 = icmp ult i32 %4, 8
  %26 = and i32 %4, -8
  %27 = icmp eq i32 %24, 0
  br label %33

28:                                               ; preds = %68, %5
  %29 = phi i32 [ 0, %5 ], [ %69, %68 ]
  %30 = add nsw i32 %16, %13
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  store i32 %29, i32 addrspace(1)* %32, align 4, !tbaa !5
  ret void

33:                                               ; preds = %17, %68
  %34 = phi i32 [ 0, %17 ], [ %70, %68 ]
  %35 = phi i32 [ 0, %17 ], [ %69, %68 ]
  %36 = mul nsw i32 %34, %4
  %37 = add i32 %18, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %40, i32 addrspace(3)* %21, align 4, !tbaa !5
  %41 = add i32 %36, %7
  %42 = mul i32 %41, %3
  %43 = add nsw i32 %42, %13
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %46, i32 addrspace(3)* %22, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %23, label %47, label %68

47:                                               ; preds = %33
  br i1 %25, label %48, label %72

48:                                               ; preds = %72, %47
  %49 = phi i32 [ undef, %47 ], [ %154, %72 ]
  %50 = phi i32 [ 0, %47 ], [ %155, %72 ]
  %51 = phi i32 [ %35, %47 ], [ %154, %72 ]
  br i1 %27, label %68, label %52

52:                                               ; preds = %48, %52
  %53 = phi i32 [ %65, %52 ], [ %50, %48 ]
  %54 = phi i32 [ %64, %52 ], [ %51, %48 ]
  %55 = phi i32 [ %66, %52 ], [ 0, %48 ]
  %56 = add nsw i32 %53, %19
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %59 = mul nsw i32 %53, %4
  %60 = add nsw i32 %59, %6
  %61 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %63 = mul nsw i32 %62, %58
  %64 = add nsw i32 %63, %54
  %65 = add nuw nsw i32 %53, 1
  %66 = add i32 %55, 1
  %67 = icmp eq i32 %66, %24
  br i1 %67, label %68, label %52, !llvm.loop !10

68:                                               ; preds = %48, %52, %33
  %69 = phi i32 [ %35, %33 ], [ %49, %48 ], [ %64, %52 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = add nuw nsw i32 %34, 1
  %71 = icmp eq i32 %70, %14
  br i1 %71, label %28, label %33, !llvm.loop !12

72:                                               ; preds = %47, %72
  %73 = phi i32 [ %155, %72 ], [ 0, %47 ]
  %74 = phi i32 [ %154, %72 ], [ %35, %47 ]
  %75 = phi i32 [ %156, %72 ], [ 0, %47 ]
  %76 = add nsw i32 %73, %19
  %77 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %79 = mul nsw i32 %73, %4
  %80 = add nsw i32 %79, %6
  %81 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %80
  %82 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !5
  %83 = mul nsw i32 %82, %78
  %84 = add nsw i32 %83, %74
  %85 = or i32 %73, 1
  %86 = add nsw i32 %85, %19
  %87 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %86
  %88 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !5
  %89 = mul nsw i32 %85, %4
  %90 = add nsw i32 %89, %6
  %91 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %90
  %92 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !5
  %93 = mul nsw i32 %92, %88
  %94 = add nsw i32 %93, %84
  %95 = or i32 %73, 2
  %96 = add nsw i32 %95, %19
  %97 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %96
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !5
  %99 = mul nsw i32 %95, %4
  %100 = add nsw i32 %99, %6
  %101 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %100
  %102 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %103 = mul nsw i32 %102, %98
  %104 = add nsw i32 %103, %94
  %105 = or i32 %73, 3
  %106 = add nsw i32 %105, %19
  %107 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %106
  %108 = load i32, i32 addrspace(3)* %107, align 4, !tbaa !5
  %109 = mul nsw i32 %105, %4
  %110 = add nsw i32 %109, %6
  %111 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %110
  %112 = load i32, i32 addrspace(3)* %111, align 4, !tbaa !5
  %113 = mul nsw i32 %112, %108
  %114 = add nsw i32 %113, %104
  %115 = or i32 %73, 4
  %116 = add nsw i32 %115, %19
  %117 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %116
  %118 = load i32, i32 addrspace(3)* %117, align 4, !tbaa !5
  %119 = mul nsw i32 %115, %4
  %120 = add nsw i32 %119, %6
  %121 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %120
  %122 = load i32, i32 addrspace(3)* %121, align 4, !tbaa !5
  %123 = mul nsw i32 %122, %118
  %124 = add nsw i32 %123, %114
  %125 = or i32 %73, 5
  %126 = add nsw i32 %125, %19
  %127 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %126
  %128 = load i32, i32 addrspace(3)* %127, align 4, !tbaa !5
  %129 = mul nsw i32 %125, %4
  %130 = add nsw i32 %129, %6
  %131 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %130
  %132 = load i32, i32 addrspace(3)* %131, align 4, !tbaa !5
  %133 = mul nsw i32 %132, %128
  %134 = add nsw i32 %133, %124
  %135 = or i32 %73, 6
  %136 = add nsw i32 %135, %19
  %137 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %136
  %138 = load i32, i32 addrspace(3)* %137, align 4, !tbaa !5
  %139 = mul nsw i32 %135, %4
  %140 = add nsw i32 %139, %6
  %141 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %140
  %142 = load i32, i32 addrspace(3)* %141, align 4, !tbaa !5
  %143 = mul nsw i32 %142, %138
  %144 = add nsw i32 %143, %134
  %145 = or i32 %73, 7
  %146 = add nsw i32 %145, %19
  %147 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1A, i32 0, i32 %146
  %148 = load i32, i32 addrspace(3)* %147, align 4, !tbaa !5
  %149 = mul nsw i32 %145, %4
  %150 = add nsw i32 %149, %6
  %151 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ9matrixMulPiS_S_iiE1B, i32 0, i32 %150
  %152 = load i32, i32 addrspace(3)* %151, align 4, !tbaa !5
  %153 = mul nsw i32 %152, %148
  %154 = add nsw i32 %153, %144
  %155 = add nuw nsw i32 %73, 8
  %156 = add i32 %75, 8
  %157 = icmp eq i32 %156, %26
  br i1 %157, label %48, label %72, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
