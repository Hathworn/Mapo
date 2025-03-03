; ModuleID = '../data/hip_kernels/15055/4/main.cu'
source_filename = "../data/hip_kernels/15055/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8erosion2PhS_iiiiE9localData = internal unnamed_addr addrspace(3) global [16384 x i8] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8erosion2PhS_iiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add nsw i32 %21, %8
  %23 = mul nsw i32 %22, %4
  %24 = add i32 %15, %7
  %25 = add i32 %24, %23
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !6
  %29 = add i32 %8, %3
  %30 = shl nsw i32 %29, 7
  %31 = add i32 %7, %2
  %32 = add i32 %31, %30
  %33 = getelementptr inbounds [16384 x i8], [16384 x i8] addrspace(3)* @_ZZ8erosion2PhS_iiiiE9localData, i32 0, i32 %32
  store i8 %28, i8 addrspace(3)* %33, align 1, !tbaa !7
  %34 = icmp eq i32 %7, 0
  br i1 %34, label %35, label %39

35:                                               ; preds = %6
  %36 = sub nsw i32 %15, %2
  %37 = tail call i32 @llvm.smax.i32(i32 %36, i32 0)
  %38 = sub nsw i32 %37, %15
  br label %49

39:                                               ; preds = %6
  %40 = add nsw i32 %14, -1
  %41 = icmp eq i32 %7, %40
  br i1 %41, label %42, label %49

42:                                               ; preds = %39
  %43 = xor i32 %15, -1
  %44 = add i32 %43, %4
  %45 = sitofp i32 %44 to double
  %46 = uitofp i32 %31 to double
  %47 = tail call double @llvm.minnum.f64(double %45, double %46)
  %48 = fptosi double %47 to i32
  br label %49

49:                                               ; preds = %39, %42, %35
  %50 = phi i32 [ %38, %35 ], [ %7, %42 ], [ %7, %39 ]
  %51 = phi i32 [ 0, %35 ], [ %48, %42 ], [ %7, %39 ]
  %52 = icmp eq i32 %8, 0
  br i1 %52, label %53, label %57

53:                                               ; preds = %49
  %54 = sub nsw i32 %21, %3
  %55 = tail call i32 @llvm.smax.i32(i32 %54, i32 0)
  %56 = sub nsw i32 %55, %21
  br label %67

57:                                               ; preds = %49
  %58 = add nsw i32 %20, -1
  %59 = icmp eq i32 %8, %58
  br i1 %59, label %60, label %67

60:                                               ; preds = %57
  %61 = xor i32 %21, -1
  %62 = add i32 %61, %5
  %63 = sitofp i32 %62 to double
  %64 = uitofp i32 %29 to double
  %65 = tail call double @llvm.minnum.f64(double %63, double %64)
  %66 = fptosi double %65 to i32
  br label %67

67:                                               ; preds = %57, %60, %53
  %68 = phi i32 [ %56, %53 ], [ %8, %60 ], [ %8, %57 ]
  %69 = phi i32 [ 0, %53 ], [ %66, %60 ], [ %8, %57 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = icmp sgt i32 %68, %69
  br i1 %70, label %82, label %71

71:                                               ; preds = %67
  %72 = icmp sgt i32 %50, %51
  br label %73

73:                                               ; preds = %71, %87
  %74 = phi i32 [ %68, %71 ], [ %88, %87 ]
  br i1 %72, label %87, label %75

75:                                               ; preds = %73
  %76 = add nsw i32 %74, %21
  %77 = mul nsw i32 %76, %4
  %78 = add nsw i32 %77, %15
  %79 = add nsw i32 %74, %3
  %80 = shl nsw i32 %79, 7
  %81 = add nsw i32 %80, %2
  br label %90

82:                                               ; preds = %87, %67
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = sub nsw i32 %7, %2
  %84 = sub nsw i32 %8, %3
  %85 = add nsw i32 %15, %83
  %86 = icmp slt i32 %85, 0
  br i1 %86, label %106, label %100

87:                                               ; preds = %90, %73
  %88 = add nsw i32 %74, 1
  %89 = icmp slt i32 %74, %69
  br i1 %89, label %73, label %82, !llvm.loop !10

90:                                               ; preds = %75, %90
  %91 = phi i32 [ %50, %75 ], [ %98, %90 ]
  %92 = add nsw i32 %78, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %93
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !7, !amdgpu.noclobber !6
  %96 = add nsw i32 %81, %91
  %97 = getelementptr inbounds [16384 x i8], [16384 x i8] addrspace(3)* @_ZZ8erosion2PhS_iiiiE9localData, i32 0, i32 %96
  store i8 %95, i8 addrspace(3)* %97, align 1, !tbaa !7
  %98 = add nsw i32 %91, 1
  %99 = icmp slt i32 %91, %51
  br i1 %99, label %90, label %87, !llvm.loop !12

100:                                              ; preds = %82
  %101 = add nsw i32 %15, %31
  %102 = icmp slt i32 %101, %4
  %103 = xor i32 %15, -1
  %104 = add i32 %103, %4
  %105 = select i1 %102, i32 %31, i32 %104
  br label %106

106:                                              ; preds = %100, %82
  %107 = phi i32 [ 0, %82 ], [ %83, %100 ]
  %108 = phi i32 [ %31, %82 ], [ %105, %100 ]
  %109 = add nsw i32 %21, %84
  %110 = icmp slt i32 %109, 0
  br i1 %110, label %117, label %111

111:                                              ; preds = %106
  %112 = add nsw i32 %21, %29
  %113 = icmp slt i32 %112, %5
  %114 = xor i32 %21, -1
  %115 = add i32 %114, %5
  %116 = select i1 %113, i32 %29, i32 %115
  br label %117

117:                                              ; preds = %111, %106
  %118 = phi i32 [ 0, %106 ], [ %84, %111 ]
  %119 = phi i32 [ %29, %106 ], [ %116, %111 ]
  %120 = icmp sgt i32 %118, %119
  br i1 %120, label %130, label %121

121:                                              ; preds = %117
  %122 = icmp sgt i32 %107, %108
  br label %123

123:                                              ; preds = %121, %133
  %124 = phi i32 [ %118, %121 ], [ %135, %133 ]
  %125 = phi i8 [ -1, %121 ], [ %134, %133 ]
  br i1 %122, label %133, label %126

126:                                              ; preds = %123
  %127 = add nsw i32 %124, %3
  %128 = shl nsw i32 %127, 7
  %129 = add nsw i32 %128, %2
  br label %137

130:                                              ; preds = %133, %117
  %131 = phi i8 [ -1, %117 ], [ %134, %133 ]
  %132 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %26
  store i8 %131, i8 addrspace(1)* %132, align 1, !tbaa !7
  ret void

133:                                              ; preds = %137, %123
  %134 = phi i8 [ %125, %123 ], [ %143, %137 ]
  %135 = add nsw i32 %124, 1
  %136 = icmp slt i32 %124, %119
  br i1 %136, label %123, label %130, !llvm.loop !13

137:                                              ; preds = %126, %137
  %138 = phi i32 [ %107, %126 ], [ %144, %137 ]
  %139 = phi i8 [ %125, %126 ], [ %143, %137 ]
  %140 = add nsw i32 %129, %138
  %141 = getelementptr inbounds [16384 x i8], [16384 x i8] addrspace(3)* @_ZZ8erosion2PhS_iiiiE9localData, i32 0, i32 %140
  %142 = load i8, i8 addrspace(3)* %141, align 1, !tbaa !7
  %143 = tail call i8 @llvm.umin.i8(i8 %139, i8 %142)
  %144 = add nsw i32 %138, 1
  %145 = icmp slt i32 %138, %108
  br i1 %145, label %137, label %133, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.umin.i8(i8, i8) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
