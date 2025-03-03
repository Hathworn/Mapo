; ModuleID = '../data/hip_kernels/14345/11/main.cu'
source_filename = "../data/hip_kernels/14345/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11iReduceSum2PiS_j(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = udiv i32 %2, %9
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %92

13:                                               ; preds = %3
  %14 = mul i32 %11, %4
  %15 = add nuw nsw i32 %4, %9
  %16 = add i32 %15, %14
  %17 = and i32 %11, 7
  %18 = icmp ult i32 %11, 8
  br i1 %18, label %75, label %19

19:                                               ; preds = %13
  %20 = and i32 %11, -8
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %72, %21 ]
  %23 = phi i32 [ 0, %19 ], [ %71, %21 ]
  %24 = phi i32 [ 0, %19 ], [ %73, %21 ]
  %25 = add i32 %16, %22
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = add nsw i32 %28, %23
  %30 = or i32 %22, 1
  %31 = add i32 %16, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = add nsw i32 %34, %29
  %36 = or i32 %22, 2
  %37 = add i32 %16, %36
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = add nsw i32 %40, %35
  %42 = or i32 %22, 3
  %43 = add i32 %16, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = add nsw i32 %46, %41
  %48 = or i32 %22, 4
  %49 = add i32 %16, %48
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = add nsw i32 %52, %47
  %54 = or i32 %22, 5
  %55 = add i32 %16, %54
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = add nsw i32 %58, %53
  %60 = or i32 %22, 6
  %61 = add i32 %16, %60
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = add nsw i32 %64, %59
  %66 = or i32 %22, 7
  %67 = add i32 %16, %66
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = add nsw i32 %70, %65
  %72 = add nuw nsw i32 %22, 8
  %73 = add i32 %24, 8
  %74 = icmp eq i32 %73, %20
  br i1 %74, label %75, label %21, !llvm.loop !11

75:                                               ; preds = %21, %13
  %76 = phi i32 [ undef, %13 ], [ %71, %21 ]
  %77 = phi i32 [ 0, %13 ], [ %72, %21 ]
  %78 = phi i32 [ 0, %13 ], [ %71, %21 ]
  %79 = icmp eq i32 %17, 0
  br i1 %79, label %92, label %80

80:                                               ; preds = %75, %80
  %81 = phi i32 [ %89, %80 ], [ %77, %75 ]
  %82 = phi i32 [ %88, %80 ], [ %78, %75 ]
  %83 = phi i32 [ %90, %80 ], [ 0, %75 ]
  %84 = add i32 %16, %81
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %88 = add nsw i32 %87, %82
  %89 = add nuw nsw i32 %81, 1
  %90 = add i32 %83, 1
  %91 = icmp eq i32 %90, %17
  br i1 %91, label %92, label %80, !llvm.loop !13

92:                                               ; preds = %75, %80, %3
  %93 = phi i32 [ 0, %3 ], [ %76, %75 ], [ %88, %80 ]
  %94 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %4
  store i32 %93, i32 addrspace(3)* %94, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = icmp ugt i16 %8, 1
  br i1 %95, label %96, label %110

96:                                               ; preds = %92, %108
  %97 = phi i32 [ %98, %108 ], [ 1, %92 ]
  %98 = shl i32 %97, 1
  %99 = mul i32 %98, %4
  %100 = icmp ult i32 %99, %9
  br i1 %100, label %101, label %108

101:                                              ; preds = %96
  %102 = add i32 %99, %97
  %103 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %102
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !7
  %105 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %99
  %106 = load i32, i32 addrspace(3)* %105, align 4, !tbaa !7
  %107 = add nsw i32 %106, %104
  store i32 %107, i32 addrspace(3)* %105, align 4, !tbaa !7
  br label %108

108:                                              ; preds = %101, %96
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %109 = icmp ult i32 %98, %9
  br i1 %109, label %96, label %110, !llvm.loop !15

110:                                              ; preds = %108, %92
  %111 = icmp eq i32 %4, 0
  br i1 %111, label %112, label %116

112:                                              ; preds = %110
  %113 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %114 = zext i32 %10 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  store i32 %113, i32 addrspace(1)* %115, align 4, !tbaa !7
  br label %116

116:                                              ; preds = %112, %110
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
