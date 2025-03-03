; ModuleID = '../data/hip_kernels/13800/3/main.cu'
source_filename = "../data/hip_kernels/13800/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12output_indexPiS_S_S_iiiE4temp = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12output_indexPiS_S_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 2
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %4
  br i1 %18, label %19, label %162

19:                                               ; preds = %7
  %20 = shl i32 %6, 2
  %21 = add nsw i32 %17, 512
  %22 = add nsw i32 %17, 1024
  %23 = add nsw i32 %17, 1536
  %24 = add nuw nsw i32 %16, 512
  %25 = or i32 %16, 1024
  %26 = add nuw nsw i32 %16, 1536
  %27 = sext i32 %17 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = sext i32 %21 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = sext i32 %22 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = sext i32 %23 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = icmp ult i32 %16, 32
  br i1 %39, label %40, label %109

40:                                               ; preds = %19
  %41 = icmp ult i32 %16, 4
  br i1 %41, label %42, label %71

42:                                               ; preds = %40
  %43 = shl nuw nsw i32 %16, 2
  %44 = mul nsw i32 %43, %5
  %45 = add i32 %44, %8
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %43
  store i32 %48, i32 addrspace(3)* %49, align 16, !tbaa !7
  %50 = add nuw nsw i32 %43, 1
  %51 = mul nsw i32 %50, %5
  %52 = add i32 %51, %8
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %50
  store i32 %55, i32 addrspace(3)* %56, align 4, !tbaa !7
  %57 = add nuw nsw i32 %43, 2
  %58 = mul nsw i32 %57, %5
  %59 = add i32 %58, %8
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %57
  store i32 %62, i32 addrspace(3)* %63, align 8, !tbaa !7
  %64 = add nuw nsw i32 %43, 3
  %65 = mul nsw i32 %64, %5
  %66 = add i32 %65, %8
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %64
  store i32 %69, i32 addrspace(3)* %70, align 4, !tbaa !7
  br label %71

71:                                               ; preds = %42, %40
  %72 = icmp ult i32 %16, 16
  br i1 %72, label %73, label %109

73:                                               ; preds = %71
  %74 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %16
  %75 = load i32, i32 addrspace(3)* %74, align 4, !tbaa !7
  %76 = icmp eq i32 %16, 0
  br i1 %76, label %82, label %77

77:                                               ; preds = %73
  %78 = add nsw i32 %16, -1
  %79 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %78
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !7
  %81 = add nsw i32 %80, %75
  store i32 %81, i32 addrspace(3)* %74, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %77, %73
  %83 = phi i32 [ %81, %77 ], [ %75, %73 ]
  %84 = icmp ugt i32 %16, 1
  br i1 %84, label %85, label %90

85:                                               ; preds = %82
  %86 = add nsw i32 %16, -2
  %87 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %86
  %88 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !7
  %89 = add nsw i32 %88, %83
  store i32 %89, i32 addrspace(3)* %74, align 4, !tbaa !7
  br label %90

90:                                               ; preds = %85, %82
  %91 = phi i32 [ %89, %85 ], [ %83, %82 ]
  %92 = icmp ugt i32 %16, 3
  br i1 %92, label %93, label %98

93:                                               ; preds = %90
  %94 = add nsw i32 %16, -4
  %95 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %94
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !7
  %97 = add nsw i32 %96, %91
  store i32 %97, i32 addrspace(3)* %74, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %93, %90
  %99 = phi i32 [ %97, %93 ], [ %91, %90 ]
  %100 = icmp ugt i32 %16, 7
  br i1 %100, label %101, label %106

101:                                              ; preds = %98
  %102 = add nsw i32 %16, -8
  %103 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %102
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !7
  %105 = add nsw i32 %104, %99
  store i32 %105, i32 addrspace(3)* %74, align 4, !tbaa !7
  br label %106

106:                                              ; preds = %101, %98
  %107 = phi i32 [ %105, %101 ], [ %99, %98 ]
  %108 = sub nsw i32 %107, %75
  store i32 %108, i32 addrspace(3)* %74, align 4, !tbaa !7
  br label %109

109:                                              ; preds = %106, %71, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = ashr i32 %29, %20
  %111 = and i32 %110, 15
  %112 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %111
  %113 = load i32, i32 addrspace(3)* %112, align 4, !tbaa !7
  %114 = ashr i32 %32, %20
  %115 = and i32 %114, 15
  %116 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %115
  %117 = load i32, i32 addrspace(3)* %116, align 4, !tbaa !7
  %118 = ashr i32 %35, %20
  %119 = and i32 %118, 15
  %120 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %119
  %121 = load i32, i32 addrspace(3)* %120, align 4, !tbaa !7
  %122 = ashr i32 %38, %20
  %123 = and i32 %122, 15
  %124 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ12output_indexPiS_S_S_iiiE4temp, i32 0, i32 %123
  %125 = load i32, i32 addrspace(3)* %124, align 4, !tbaa !7
  %126 = mul nsw i32 %111, %5
  %127 = add i32 %126, %8
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = mul nsw i32 %115, %5
  %132 = add i32 %131, %8
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = mul nsw i32 %119, %5
  %137 = add i32 %136, %8
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = mul nsw i32 %123, %5
  %142 = add i32 %141, %8
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = sub i32 %16, %113
  %147 = add i32 %146, %130
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %148
  store i32 %29, i32 addrspace(1)* %149, align 4, !tbaa !7
  %150 = sub i32 %24, %117
  %151 = add i32 %150, %135
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %152
  store i32 %32, i32 addrspace(1)* %153, align 4, !tbaa !7
  %154 = sub i32 %25, %121
  %155 = add i32 %154, %140
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %156
  store i32 %35, i32 addrspace(1)* %157, align 4, !tbaa !7
  %158 = sub i32 %26, %125
  %159 = add i32 %158, %145
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %160
  store i32 %38, i32 addrspace(1)* %161, align 4, !tbaa !7
  br label %162

162:                                              ; preds = %109, %7
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
