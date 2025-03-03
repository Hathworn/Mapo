; ModuleID = '../data/hip_kernels/4933/39/main.cu'
source_filename = "../data/hip_kernels/4933/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17reduceUnrolling16PiS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 4
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = mul nuw nsw i32 %10, 15
  %17 = add i32 %13, %16
  %18 = icmp ult i32 %17, %2
  br i1 %18, label %19, label %110

19:                                               ; preds = %3
  %20 = zext i32 %13 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = add i32 %13, %10
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = shl nuw nsw i32 %10, 1
  %28 = add i32 %13, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = mul nuw nsw i32 %10, 3
  %33 = add i32 %13, %32
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = shl nuw nsw i32 %10, 2
  %38 = add i32 %13, %37
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = mul nuw nsw i32 %10, 5
  %43 = add i32 %13, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = mul nuw nsw i32 %10, 6
  %48 = add i32 %13, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = mul nuw nsw i32 %10, 7
  %53 = add i32 %13, %52
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = shl nuw nsw i32 %10, 3
  %58 = add i32 %13, %57
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = mul nuw nsw i32 %10, 9
  %63 = add i32 %13, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = mul nuw nsw i32 %10, 10
  %68 = add i32 %13, %67
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = mul nuw nsw i32 %10, 11
  %73 = add i32 %13, %72
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = mul nuw nsw i32 %10, 12
  %78 = add i32 %13, %77
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = mul nuw nsw i32 %10, 13
  %83 = add i32 %13, %82
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = mul nuw nsw i32 %10, 14
  %88 = add i32 %13, %87
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !6
  %92 = zext i32 %17 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !6
  %95 = add nsw i32 %26, %22
  %96 = add nsw i32 %95, %31
  %97 = add nsw i32 %96, %36
  %98 = add nsw i32 %97, %41
  %99 = add nsw i32 %98, %46
  %100 = add nsw i32 %99, %51
  %101 = add nsw i32 %100, %56
  %102 = add nsw i32 %101, %61
  %103 = add nsw i32 %102, %66
  %104 = add nsw i32 %103, %71
  %105 = add nsw i32 %104, %76
  %106 = add nsw i32 %105, %81
  %107 = add nsw i32 %106, %86
  %108 = add nsw i32 %107, %91
  %109 = add nsw i32 %108, %94
  store i32 %109, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %110

110:                                              ; preds = %19, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %111 = icmp ult i16 %9, 2
  br i1 %111, label %115, label %112

112:                                              ; preds = %110
  %113 = zext i32 %4 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %113
  br label %117

115:                                              ; preds = %128, %110
  %116 = icmp eq i32 %4, 0
  br i1 %116, label %130, label %134

117:                                              ; preds = %112, %128
  %118 = phi i32 [ %10, %112 ], [ %119, %128 ]
  %119 = lshr i32 %118, 1
  %120 = icmp ult i32 %4, %119
  br i1 %120, label %121, label %128

121:                                              ; preds = %117
  %122 = add nuw nsw i32 %119, %4
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7
  %126 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !7
  %127 = add nsw i32 %126, %125
  store i32 %127, i32 addrspace(1)* %114, align 4, !tbaa !7
  br label %128

128:                                              ; preds = %121, %117
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = icmp ult i32 %118, 4
  br i1 %129, label %115, label %117, !llvm.loop !11

130:                                              ; preds = %115
  %131 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %132 = zext i32 %5 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %132
  store i32 %131, i32 addrspace(1)* %133, align 4, !tbaa !7
  br label %134

134:                                              ; preds = %130, %115
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
