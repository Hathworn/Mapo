; ModuleID = '../data/hip_kernels/697/4/main.cu'
source_filename = "../data/hip_kernels/697/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@tileImage = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19shareMatrixMultiplePiiiS_iS_(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %11, 5
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = add i32 %1, 1
  %16 = sub i32 %15, %4
  %17 = add nsw i32 %4, 31
  %18 = mul nsw i32 %10, %1
  %19 = add nsw i32 %18, %14
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = mul i32 %17, %9
  %24 = add i32 %23, %13
  %25 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %24
  store i32 %22, i32 addrspace(3)* %25, align 4, !tbaa !5
  %26 = add nsw i32 %4, -1
  %27 = icmp uge i32 %13, %26
  br i1 %27, label %35, label %28

28:                                               ; preds = %6
  %29 = add nsw i32 %19, 32
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = add i32 %24, 32
  %34 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %33
  store i32 %32, i32 addrspace(3)* %34, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %28, %6
  %36 = icmp uge i32 %9, %26
  br i1 %36, label %48, label %37

37:                                               ; preds = %35
  %38 = add nsw i32 %10, 32
  %39 = mul nsw i32 %38, %1
  %40 = add nsw i32 %39, %14
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = add nuw nsw i32 %9, 32
  %45 = mul i32 %17, %44
  %46 = add i32 %45, %13
  %47 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %46
  store i32 %43, i32 addrspace(3)* %47, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %37, %35
  %49 = select i1 %27, i1 true, i1 %36
  br i1 %49, label %63, label %50

50:                                               ; preds = %48
  %51 = add nsw i32 %10, 32
  %52 = mul nsw i32 %51, %1
  %53 = add i32 %14, 32
  %54 = add i32 %53, %52
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = add nuw nsw i32 %9, 32
  %59 = mul i32 %17, %58
  %60 = add nuw nsw i32 %13, 32
  %61 = add i32 %60, %59
  %62 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %61
  store i32 %57, i32 addrspace(3)* %62, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %48, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = mul nsw i32 %2, %1
  %65 = icmp slt i32 %19, %64
  br i1 %65, label %66, label %196

66:                                               ; preds = %63
  %67 = icmp sgt i32 %4, 0
  br i1 %67, label %68, label %80

68:                                               ; preds = %66
  %69 = and i32 %4, 7
  %70 = icmp ult i32 %4, 8
  %71 = and i32 %4, -8
  %72 = icmp eq i32 %69, 0
  br label %73

73:                                               ; preds = %68, %106
  %74 = phi i32 [ %108, %106 ], [ 0, %68 ]
  %75 = phi i32 [ %107, %106 ], [ 0, %68 ]
  %76 = mul nsw i32 %74, %4
  %77 = add nuw i32 %74, %9
  %78 = mul i32 %77, %17
  %79 = add i32 %78, %13
  br i1 %70, label %86, label %110

80:                                               ; preds = %106, %66
  %81 = phi i32 [ 0, %66 ], [ %107, %106 ]
  %82 = mul nsw i32 %16, %10
  %83 = add nsw i32 %82, %14
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %84
  store i32 %81, i32 addrspace(1)* %85, align 4, !tbaa !5
  br label %196

86:                                               ; preds = %110, %73
  %87 = phi i32 [ undef, %73 ], [ %192, %110 ]
  %88 = phi i32 [ 0, %73 ], [ %193, %110 ]
  %89 = phi i32 [ %75, %73 ], [ %192, %110 ]
  br i1 %72, label %106, label %90

90:                                               ; preds = %86, %90
  %91 = phi i32 [ %103, %90 ], [ %88, %86 ]
  %92 = phi i32 [ %102, %90 ], [ %89, %86 ]
  %93 = phi i32 [ %104, %90 ], [ 0, %86 ]
  %94 = add nsw i32 %91, %76
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  %98 = add i32 %79, %91
  %99 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !5
  %101 = mul nsw i32 %100, %97
  %102 = add nsw i32 %101, %92
  %103 = add nuw nsw i32 %91, 1
  %104 = add i32 %93, 1
  %105 = icmp eq i32 %104, %69
  br i1 %105, label %106, label %90, !llvm.loop !10

106:                                              ; preds = %90, %86
  %107 = phi i32 [ %87, %86 ], [ %102, %90 ]
  %108 = add nuw nsw i32 %74, 1
  %109 = icmp eq i32 %108, %4
  br i1 %109, label %80, label %73, !llvm.loop !12

110:                                              ; preds = %73, %110
  %111 = phi i32 [ %193, %110 ], [ 0, %73 ]
  %112 = phi i32 [ %192, %110 ], [ %75, %73 ]
  %113 = phi i32 [ %194, %110 ], [ 0, %73 ]
  %114 = add nsw i32 %111, %76
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = add i32 %79, %111
  %119 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %118
  %120 = load i32, i32 addrspace(3)* %119, align 4, !tbaa !5
  %121 = mul nsw i32 %120, %117
  %122 = add nsw i32 %121, %112
  %123 = or i32 %111, 1
  %124 = add nsw i32 %123, %76
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = add i32 %79, %123
  %129 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %128
  %130 = load i32, i32 addrspace(3)* %129, align 4, !tbaa !5
  %131 = mul nsw i32 %130, %127
  %132 = add nsw i32 %131, %122
  %133 = or i32 %111, 2
  %134 = add nsw i32 %133, %76
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %135
  %137 = load i32, i32 addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = add i32 %79, %133
  %139 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %138
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !5
  %141 = mul nsw i32 %140, %137
  %142 = add nsw i32 %141, %132
  %143 = or i32 %111, 3
  %144 = add nsw i32 %143, %76
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %145
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !5, !amdgpu.noclobber !9
  %148 = add i32 %79, %143
  %149 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %148
  %150 = load i32, i32 addrspace(3)* %149, align 4, !tbaa !5
  %151 = mul nsw i32 %150, %147
  %152 = add nsw i32 %151, %142
  %153 = or i32 %111, 4
  %154 = add nsw i32 %153, %76
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !5, !amdgpu.noclobber !9
  %158 = add i32 %79, %153
  %159 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %158
  %160 = load i32, i32 addrspace(3)* %159, align 4, !tbaa !5
  %161 = mul nsw i32 %160, %157
  %162 = add nsw i32 %161, %152
  %163 = or i32 %111, 5
  %164 = add nsw i32 %163, %76
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %165
  %167 = load i32, i32 addrspace(1)* %166, align 4, !tbaa !5, !amdgpu.noclobber !9
  %168 = add i32 %79, %163
  %169 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %168
  %170 = load i32, i32 addrspace(3)* %169, align 4, !tbaa !5
  %171 = mul nsw i32 %170, %167
  %172 = add nsw i32 %171, %162
  %173 = or i32 %111, 6
  %174 = add nsw i32 %173, %76
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %175
  %177 = load i32, i32 addrspace(1)* %176, align 4, !tbaa !5, !amdgpu.noclobber !9
  %178 = add i32 %79, %173
  %179 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %178
  %180 = load i32, i32 addrspace(3)* %179, align 4, !tbaa !5
  %181 = mul nsw i32 %180, %177
  %182 = add nsw i32 %181, %172
  %183 = or i32 %111, 7
  %184 = add nsw i32 %183, %76
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %185
  %187 = load i32, i32 addrspace(1)* %186, align 4, !tbaa !5, !amdgpu.noclobber !9
  %188 = add i32 %79, %183
  %189 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @tileImage, i32 0, i32 %188
  %190 = load i32, i32 addrspace(3)* %189, align 4, !tbaa !5
  %191 = mul nsw i32 %190, %187
  %192 = add nsw i32 %191, %182
  %193 = add nuw nsw i32 %111, 8
  %194 = add i32 %113, 8
  %195 = icmp eq i32 %194, %71
  br i1 %195, label %86, label %110, !llvm.loop !14

196:                                              ; preds = %80, %63
  ret void
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
