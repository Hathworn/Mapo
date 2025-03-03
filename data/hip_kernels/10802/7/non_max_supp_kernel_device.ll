; ModuleID = '../data/hip_kernels/10802/7/main.cu'
source_filename = "../data/hip_kernels/10802/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@l_mem = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19non_max_supp_kernelPhS_S_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i8 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add nuw nsw i32 %19, 1
  %21 = add i32 %20, %18
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %12, %22
  %24 = add nuw nsw i32 %22, 1
  %25 = mul nsw i32 %21, %4
  %26 = add i32 %25, %23
  %27 = add i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !5
  %31 = zext i8 %30 to i32
  %32 = add nuw nsw i32 %11, 2
  %33 = mul nuw nsw i32 %32, %20
  %34 = add nuw nsw i32 %33, %24
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %34
  store i32 %31, i32 addrspace(3)* %35, align 4, !tbaa !10
  %36 = icmp eq i32 %19, 0
  br i1 %36, label %37, label %61

37:                                               ; preds = %5
  %38 = sub nsw i32 %27, %4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !amdgpu.noclobber !5
  %42 = zext i8 %41 to i32
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %24
  store i32 %42, i32 addrspace(3)* %43, align 4, !tbaa !10
  %44 = icmp eq i32 %22, 0
  br i1 %44, label %45, label %51

45:                                               ; preds = %37
  %46 = add nsw i32 %38, -1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !7, !amdgpu.noclobber !5
  %50 = zext i8 %49 to i32
  store i32 %50, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 0), align 4, !tbaa !10
  br label %91

51:                                               ; preds = %37
  %52 = icmp eq i32 %24, %11
  br i1 %52, label %53, label %91

53:                                               ; preds = %51
  %54 = add nsw i32 %38, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7, !amdgpu.noclobber !5
  %58 = zext i8 %57 to i32
  %59 = add nuw nsw i32 %11, 1
  %60 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %59
  store i32 %58, i32 addrspace(3)* %60, align 4, !tbaa !10
  br label %91

61:                                               ; preds = %5
  %62 = icmp eq i32 %20, %11
  br i1 %62, label %63, label %91

63:                                               ; preds = %61
  %64 = add nsw i32 %27, %4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7, !amdgpu.noclobber !5
  %68 = zext i8 %67 to i32
  %69 = add nuw nsw i32 %11, 1
  %70 = mul nuw nsw i32 %69, %32
  %71 = add nuw nsw i32 %70, %24
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %71
  store i32 %68, i32 addrspace(3)* %72, align 4, !tbaa !10
  %73 = icmp eq i32 %22, 0
  br i1 %73, label %74, label %81

74:                                               ; preds = %63
  %75 = add i32 %26, %4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !7, !amdgpu.noclobber !5
  %79 = zext i8 %78 to i32
  %80 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %70
  store i32 %79, i32 addrspace(3)* %80, align 4, !tbaa !10
  br label %91

81:                                               ; preds = %63
  %82 = icmp eq i32 %24, %11
  br i1 %82, label %83, label %91

83:                                               ; preds = %81
  %84 = add nsw i32 %64, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %85
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !7, !amdgpu.noclobber !5
  %88 = zext i8 %87 to i32
  %89 = add nuw nsw i32 %70, %69
  %90 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %89
  store i32 %88, i32 addrspace(3)* %90, align 4, !tbaa !10
  br label %91

91:                                               ; preds = %61, %81, %83, %74, %45, %53, %51
  %92 = icmp eq i32 %22, 0
  br i1 %92, label %99, label %93

93:                                               ; preds = %91
  %94 = icmp eq i32 %24, %11
  br i1 %94, label %95, label %107

95:                                               ; preds = %93
  %96 = add i32 %26, 2
  %97 = add nuw nsw i32 %11, 1
  %98 = add nuw nsw i32 %97, %33
  br label %99

99:                                               ; preds = %91, %95
  %100 = phi i32 [ %98, %95 ], [ %33, %91 ]
  %101 = phi i32 [ %96, %95 ], [ %26, %91 ]
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %102
  %104 = load i8, i8 addrspace(1)* %103, align 1, !tbaa !7
  %105 = zext i8 %104 to i32
  %106 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %100
  store i32 %105, i32 addrspace(3)* %106, align 4, !tbaa !10
  br label %107

107:                                              ; preds = %99, %93
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %108 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !10
  %109 = trunc i32 %108 to i8
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %28
  %111 = load i8, i8 addrspace(1)* %110, align 1, !tbaa !7
  switch i8 %111, label %162 [
    i8 0, label %112
    i8 45, label %120
    i8 90, label %132
    i8 -121, label %143
  ]

112:                                              ; preds = %107
  %113 = and i32 %108, 255
  %114 = add nuw nsw i32 %34, 1
  %115 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %114
  %116 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !10
  %117 = icmp sgt i32 %113, %116
  br i1 %117, label %118, label %162

118:                                              ; preds = %112
  %119 = add nuw nsw i32 %33, %22
  br label %155

120:                                              ; preds = %107
  %121 = and i32 %108, 255
  %122 = mul nuw nsw i32 %32, %19
  %123 = add nuw nsw i32 %22, 2
  %124 = add nuw nsw i32 %123, %122
  %125 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %124
  %126 = load i32, i32 addrspace(3)* %125, align 4, !tbaa !10
  %127 = icmp sgt i32 %121, %126
  br i1 %127, label %128, label %162

128:                                              ; preds = %120
  %129 = add nuw nsw i32 %19, 2
  %130 = mul nuw nsw i32 %32, %129
  %131 = add nuw nsw i32 %130, %22
  br label %155

132:                                              ; preds = %107
  %133 = and i32 %108, 255
  %134 = mul nuw nsw i32 %32, %19
  %135 = add nuw nsw i32 %134, %24
  %136 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %135
  %137 = load i32, i32 addrspace(3)* %136, align 4, !tbaa !10
  %138 = icmp sgt i32 %133, %137
  br i1 %138, label %139, label %162

139:                                              ; preds = %132
  %140 = add nuw nsw i32 %19, 2
  %141 = mul nuw nsw i32 %32, %140
  %142 = add nuw nsw i32 %141, %24
  br label %155

143:                                              ; preds = %107
  %144 = and i32 %108, 255
  %145 = mul nuw nsw i32 %32, %19
  %146 = add nuw nsw i32 %145, %22
  %147 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %146
  %148 = load i32, i32 addrspace(3)* %147, align 4, !tbaa !10
  %149 = icmp sgt i32 %144, %148
  br i1 %149, label %150, label %162

150:                                              ; preds = %143
  %151 = add nuw nsw i32 %19, 2
  %152 = mul nuw nsw i32 %32, %151
  %153 = add nuw nsw i32 %22, 2
  %154 = add nuw nsw i32 %153, %152
  br label %155

155:                                              ; preds = %118, %128, %139, %150
  %156 = phi i32 [ %154, %150 ], [ %142, %139 ], [ %131, %128 ], [ %119, %118 ]
  %157 = phi i32 [ %144, %150 ], [ %133, %139 ], [ %121, %128 ], [ %113, %118 ]
  %158 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %156
  %159 = load i32, i32 addrspace(3)* %158, align 4, !tbaa !10
  %160 = icmp sgt i32 %157, %159
  %161 = select i1 %160, i8 %109, i8 0
  br label %162

162:                                              ; preds = %155, %107, %143, %132, %120, %112
  %163 = phi i8 [ 0, %112 ], [ 0, %120 ], [ 0, %132 ], [ 0, %143 ], [ %109, %107 ], [ %161, %155 ]
  %164 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %28
  store i8 %163, i8 addrspace(1)* %164, align 1, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
